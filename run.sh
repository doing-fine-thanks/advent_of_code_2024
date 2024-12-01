find src -name "*.odin"  | tail -r | xargs -I {} odin run {} -file
rm *.bin
