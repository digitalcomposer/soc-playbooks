#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   export GITHUB_TOKEN="<token_with_repo_scope>"
#   export GITHUB_USER="<your_github_username>"
#   ./publish_to_github.sh [repo-name]

REPO_NAME="${1:-soc-playbooks}"
: "${GITHUB_TOKEN:?Set GITHUB_TOKEN first}"
: "${GITHUB_USER:?Set GITHUB_USER first}"

API_RESPONSE_CODE=$(curl -sS -o /tmp/create_repo_response.json -w "%{http_code}" \
  -X POST https://api.github.com/user/repos \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -d "{\"name\":\"${REPO_NAME}\",\"private\":false,\"description\":\"SOC playbooks for Wireshark, TLS checks, Nmap, and hash cracking\"}")

if [[ "${API_RESPONSE_CODE}" != "201" ]]; then
  echo "GitHub repo creation failed (HTTP ${API_RESPONSE_CODE}):"
  cat /tmp/create_repo_response.json
  exit 1
fi

REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "${REMOTE_URL}"
else
  git remote add origin "${REMOTE_URL}"
fi

git push -u origin main

echo "Repository created and pushed: ${REMOTE_URL}"
