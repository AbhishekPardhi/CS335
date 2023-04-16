#!/bin/bash

# Run ./ass.sh in X86_64 directory to get x86_64 code of all of the java files
# present inside tests folder into the x86_codes folder

directory="./tests"
output_dir="x86_codes"
mkdir -p "./$output_dir"

cd "$directory"

for file in *.java; do
  filename="${file%.*}"

  javac "$file"

  objdump -D -M intel -b binary -mi386 --no-show-raw-insn "$filename.class" > "../$output_dir/$filename.s"

done

cd ..
