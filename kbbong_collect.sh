#!/bin/zsh
# 국뽕 뉴스 대시보드 자동 수집 스크립트 (launchd에서 하루 2번 실행)
export PATH="/Users/taejune/.npm-global/bin:/usr/local/bin:/usr/bin:/bin:/opt/homebrew/bin:$PATH"

DIR="/Users/taejune/Downloads/ai_office"
LOG="$DIR/kbbong_collect.log"
PROMPT_FILE="$DIR/kbbong_collector_prompt.md"

echo "===== 수집 시작: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$LOG"

cd "$DIR" || exit 1

claude -p "$(cat "$PROMPT_FILE")" \
  --allowedTools "WebSearch,Read,Edit,Glob,Grep" \
  --permission-mode acceptEdits \
  >> "$LOG" 2>&1

echo "===== 수집 종료: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$LOG"
echo "" >> "$LOG"
