#!/bin/sh

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

wget -qO- $(curl -sL https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r '.assets[] | select(.name | test("^fzf-.*-linux_amd64.tar.gz$")) | .browser_download_url') | tar -zxvf - fzf && install -c -m 0755 fzf /home/dupouey/.local/bin/fzf

az extension add --name fzf

wget -qO- $(curl -sL https://api.github.com/repos/kubecolor/kubecolor/releases/latest | jq -r '.assets[] | select(.name | test("^kubecolor_.*_linux_amd64.tar.gz$")) | .browser_download_url') | tar -zxvf - kubecolor && install -c -m 0755 kubecolor /home/dupouey/.local/bin/_kubecolor

wget -O ~/.kubectl_aliases https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
sed -ri 's/owide//g' ~/.kubectl_aliases
sed -ri 's/kubectl (.*) --watch/watch -n5 -c unbuffer _kubecolor \1/g' ~/.kubectl_aliases
sed -i '/kubectl exec/d' ~/.kubectl_aliases
sed -i '/kubectl logs/d' ~/.kubectl_aliases
sed -i '/kubectl describe/d' ~/.kubectl_aliases
sed -i '/kg=/d' ~/.kubectl_aliases
sed -ri 's/kubectl/_kubecolor/g' ~/.kubectl_aliases