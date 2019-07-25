#!/usr/bin/env bash

base_dir="/root/go/src"

declare -A map=(
    ["github.com/klauspost/asmfmt"]="0"
    ["github.com/go-delve/delve"]="0"
    ["github.com/kisielk/errcheck"]="0"
    ["github.com/davidrjenni/reftools"]="0"
    ["github.com/mdempsky/gocode"]="0"
    ["github.com/stamblerre/gocode"]="0"
    ["github.com/rogpeppe/godef"]="0"
    ["github.com/zmb3/gogetdoc"]="0"
    ["github.com/golang/tools"]="${base_dir}/golang.org/x/tools"
    ["github.com/golang/lint"]="${base_dir}/golang.org/x/lint"
    ["github.com/alecthomas/gometalinter"]="0"
    ["github.com/golangci/golangci-lint"]="0"
    ["github.com/fatih/gomodifytags"]="0"
    ["github.com/jstemmer/gotags"]="0"
    ["github.com/josharian/impl"]="0"
    ["github.com/dominikh/go-tools"]="${base_dir}/honnef.co/go/tools"
    ["github.com/fatih/motion"]="0"
    ["github.com/koron/iferr"]="0"
    ["github.com/golang/sync"]="${base_dir}/golang.org/x/sync"
)

for key in ${!map[@]}
do
    target_dir=${map[$key]}
    if [ "$target_dir"x = "0"x ]; then
        target_dir="${base_dir}/${key}"
    fi

    source_url="https://${key}.git"

    #echo $target_dir
    git clone ${source_url} ${target_dir}
done
