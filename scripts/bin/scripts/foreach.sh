#!/bin/bash

cmd=$1

echo $cmd ./some_file.rs
for file in $(find ./ -name '*.rs'); do
    $($cmd $file)
done
