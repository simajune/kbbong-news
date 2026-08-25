#!/bin/zsh
# 국뽕 뉴스 웹페이지(index.html) 자동 갱신 + GitHub push (launchd에서 하루 2번 실행)
# 노션은 별도로 claude.ai 클라우드 루틴이 갱신함.
export PATH="/Users/taejune/.npm-global/bin:/usr/local/bin:/usr/bin:/bin:/opt/homebrew/bin:$PATH"

DIR="/Users/taejune/Downloads/ai_office"
LOG="$DIR/kbbong_collect.log"
PROMPT_FILE="$DIR/kbbong_web_prompt.md"

echo "===== 수집 시작: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$LOG"
cd "$DIR" || exit 1

claude -p "$(cat "$PROMPT_FILE")" \
  --allowedTools "WebSearch,Read,Edit,Glob,Grep,Bash" \
  --permission-mode acceptEdits \
  >> "$LOG" 2>&1

echo "===== 수집 종료: $(date '+%Y-%m-%d %H:%M:%S') =====" >> "$LOG"
echo "" >> "$LOG"
