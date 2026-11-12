#!/usr/bin/env bash
# ==============================================================================
# Script Name: analyze_logs.sh
# Description: Analyzes web server access logs to report total traffic,
#              status code distribution, top active IPs, and security warnings.
# Author: Vinay Kumrawat (BT25CSE159)
# ==============================================================================

set -euo pipefail

LOG_FILE="${1:-}"

# Check if log file is provided
if [ -z "$LOG_FILE" ]; then
    echo "Error: No log file specified." >&2
    echo "Usage: $0 <path_to_access_log>" >&2
    exit 1
fi

# Check if file exists and is readable
if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
    echo "Error: Cannot read log file '$LOG_FILE'." >&2
    exit 1
fi

echo "================================================================================"
echo "                     WEB SERVER ACCESS LOG ANALYSIS REPORT                      "
echo "================================================================================"

awk '
{
    # Expected line format: [YYYY-MM-DD HH:MM:SS] IP METHOD URL STATUS RESPONSE_TIME
    ip = $3
    method = $4
    endpoint = $5
    status = $6
    res_time = $7 + 0

    total_requests++
    ip_count[ip]++
    endpoint_count[endpoint]++
    total_time += res_time

    if (status ~ /^2/) status_2xx++
    else if (status ~ /^3/) status_3xx++
    else if (status ~ /^4/) {
        status_4xx++
        ip_errors[ip]++
    }
    else if (status ~ /^5/) status_5xx++
}
END {
    if (total_requests == 0) {
        print "No log records found to analyze."
        exit 0
    }

    printf "Total Requests Analyzed  : %d\n", total_requests
    printf "Average Response Time    : %.2f ms\n", (total_time / total_requests)
    print "--------------------------------------------------------------------------------"
    print "HTTP Status Code Distribution:"
    printf "  - 2xx Success          : %d (%.1f%%)\n", status_2xx, (status_2xx * 100 / total_requests)
    printf "  - 3xx Redirection      : %d (%.1f%%)\n", status_3xx, (status_3xx * 100 / total_requests)
    printf "  - 4xx Client Error     : %d (%.1f%%)\n", status_4xx, (status_4xx * 100 / total_requests)
    printf "  - 5xx Server Error     : %d (%.1f%%)\n", status_5xx, (status_5xx * 100 / total_requests)
    print "--------------------------------------------------------------------------------"
    print "Top Client IP Addresses by Activity:"

    n = 0
    for (addr in ip_count) {
        n++
        ips[n] = addr
        hits[n] = ip_count[addr]
    }
    for (i = 1; i <= n; i++) {
        for (j = i + 1; j <= n; j++) {
            if (hits[j] > hits[i]) {
                tmp_h = hits[i]; hits[i] = hits[j]; hits[j] = tmp_h
                tmp_ip = ips[i]; ips[i] = ips[j]; ips[j] = tmp_ip
            }
        }
    }
    limit = (n < 3) ? n : 3
    for (i = 1; i <= limit; i++) {
        printf "  %d. %-18s : %d requests\n", i, ips[i], hits[i]
    }

    print "--------------------------------------------------------------------------------"
    print "Security Watchlist (IPs with multiple 4xx errors):"
    flagged = 0
    for (addr in ip_errors) {
        if (ip_errors[addr] >= 2) {
            printf "  [ALERT] IP %-15s generated %d client errors (potential probing)\n", \
                addr, ip_errors[addr]
            flagged++
        }
    }
    if (flagged == 0) {
        print "  No suspicious client activity detected."
    }
    print "================================================================================"
}
' "$LOG_FILE"
