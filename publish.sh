#!/bin/bash
# 代理店のよくある質問を GitHub Pages（https://smk2project-ai.github.io/faq/）に出す。
# 元はこのフォルダの index.html。中身の正本は Addness ナレッジ「MK2の代理店からの問い合わせ（振込・退会・会費・明細）に答える」。
# 使い方: ./publish.sh "変更の説明"
set -e
cd "$(dirname "$0")"
git add index.html publish.sh
if git diff --cached --quiet; then echo "変更なし"; exit 0; fi
git commit -q -m "${1:-よくある質問を更新}" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push -q origin main
echo "公開しました: https://smk2project-ai.github.io/faq/"
