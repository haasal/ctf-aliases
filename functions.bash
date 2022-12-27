grep_string() {
    # $1: binary
    # $2 string pattern
    strings -a -t x $1 | grep $2
}

serve_binary() {
    # $1: binary
    # $2: port
    if [-z $2]; then
        echo "Using port 5000"
        $2=5000
    fi
    socat tcp-l:$2,reuseaddr,fork EXEC:"$1",pty,stderr
}

bin_to_cstr() {
    # $1: binary
    hexdump -v -e '"\\""x" 1/1 "%02x" ""' $1
}
