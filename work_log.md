## 2024.01.01 - cargo run で エラー

- cc がないというエラーがでる
```
error: linker `cc` not found
  |
  = note: No such file or directory (os error 2)

error: aborting due to previous error
```
参考: https://qiita.com/ismt7/items/a6b17b01b56f098b2dd5
- コンテナ作成してログインしてから apt-get install gcc してからだとエラーがでない
- Dockerfile で apt-get install gcc すると下記エラーがでる
```shell
hagevvashi@205f91c6826a:~/project/hello_cargo$ cargo run
   Compiling hello_cargo v0.1.0 (/home/hagevvashi/project/hello_cargo)
error: linking with `cc` failed: exit status: 1
  |
  = note: LC_ALL="C" PATH="/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/bin:/home/hagevvashi/.cargo/bin:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" VSLANG="1033" "cc" "/tmp/rustcAI6SFd/symbols.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2u5nxw4jgg6b2mb6.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.370qddv2fvr51c2x.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.5g2ary7xpefacc66.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.9bk1x77kn0dx7lk.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2ttf3lhp3o2bjklb.rcgu.o" "-Wl,--as-needed" "-L" "/home/hagevvashi/project/hello_cargo/target/debug/deps" "-L" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib" "-Wl,-Bstatic" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libstd-ff9e2f4daa5f5044.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libpanic_unwind-4c069e5be14e089e.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libobject-5dad8c6832fe5ee1.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libmemchr-08fa975fabbb7847.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libaddr2line-6fa5c572933bd83c.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libgimli-29e75079cbe951ff.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_demangle-770a536d7b802f6e.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libstd_detect-828e977783680240.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libhashbrown-c2f157ffd03af249.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_std_workspace_alloc-07044d868b568254.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libminiz_oxide-b9447ffb1c9d5ec5.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libadler-287e4034a78ea916.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libunwind-c821617a29de84b3.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcfg_if-077e039e6f0bd75d.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/liblibc-27cd7f142906ea75.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/liballoc-55c809a1b2d51fd2.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_std_workspace_core-fc61da4cf34b1cd0.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcore-ead1225e03eb63b1.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcompiler_builtins-3f410048cea510b6.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib" "-o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
  = note: /usr/bin/ld: cannot find Scrt1.o: No such file or directory
          /usr/bin/ld: cannot find crti.o: No such file or directory
          /usr/bin/ld: cannot find /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.370qddv2fvr51c2x.rcgu.o: No such file or directory
          collect2: error: ld returned 1 exit status


error: could not compile `hello_cargo` (bin "hello_cargo") due to previous error
```
- build-essential パッケージをインストールすれば解決すると書かれている
    - https://users.rust-lang.org/t/solved-hello-world-wont-compile/2674
    - https://unix.stackexchange.com/questions/216856/c-compiler-cannot-create-executables
- build-essential パッケージをインストールしても解決しない。↓エラー
```shell
hagevvashi@1fd77c1cc00a:~/project/hello_cargo$ cargo run
   Compiling hello_cargo v0.1.0 (/home/hagevvashi/project/hello_cargo)
error: linking with `cc` failed: exit status: 1
  |
  = note: LC_ALL="C" PATH="/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/bin:/home/hagevvashi/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" VSLANG="1033" "cc" "/tmp/rustcVCJAIc/symbols.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2u5nxw4jgg6b2mb6.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.370qddv2fvr51c2x.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.5g2ary7xpefacc66.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.9bk1x77kn0dx7lk.rcgu.o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2ttf3lhp3o2bjklb.rcgu.o" "-Wl,--as-needed" "-L" "/home/hagevvashi/project/hello_cargo/target/debug/deps" "-L" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib" "-Wl,-Bstatic" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libstd-ff9e2f4daa5f5044.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libpanic_unwind-4c069e5be14e089e.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libobject-5dad8c6832fe5ee1.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libmemchr-08fa975fabbb7847.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libaddr2line-6fa5c572933bd83c.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libgimli-29e75079cbe951ff.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_demangle-770a536d7b802f6e.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libstd_detect-828e977783680240.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libhashbrown-c2f157ffd03af249.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_std_workspace_alloc-07044d868b568254.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libminiz_oxide-b9447ffb1c9d5ec5.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libadler-287e4034a78ea916.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libunwind-c821617a29de84b3.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcfg_if-077e039e6f0bd75d.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/liblibc-27cd7f142906ea75.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/liballoc-55c809a1b2d51fd2.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/librustc_std_workspace_core-fc61da4cf34b1cd0.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcore-ead1225e03eb63b1.rlib" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib/libcompiler_builtins-3f410048cea510b6.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/home/hagevvashi/.rustup/toolchains/stable-aarch64-unknown-linux-gnu/lib/rustlib/aarch64-unknown-linux-gnu/lib" "-o" "/home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
  = note: /usr/bin/ld: cannot find /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o: No such file or directory
          /usr/bin/ld: cannot find /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o: No such file or directory
          collect2: error: ld returned 1 exit status


error: could not compile `hello_cargo` (bin "hello_cargo") due to previous error
```
    - `/usr/bin/ld: cannot find /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o: No such file or directory` `/usr/bin/ld: cannot find /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o: No such file or directory` これはエラーの内容。このファイルを ls してみると普通にある
```shell
hagevvashi@1fd77c1cc00a:~/project/hello_cargo$ ls -la /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o
-rw-r--r-- 2 hagevvashi dialout 9944 Jan  1 15:26 /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.1wfn2ijqjo8ori7p.rcgu.o
hagevvashi@1fd77c1cc00a:~/project/hello_cargo$ ls -la /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o
-rw-r--r-- 2 hagevvashi dialout 4616 Jan  1 15:26 /home/hagevvashi/project/hello_cargo/target/debug/deps/hello_cargo-2c4af5af4d79ebed.2xo3xxqr87y5jij5.rcgu.o
```
        - というわけでもう一度 cargo run すると今度は成功する
```shell
hagevvashi@1fd77c1cc00a:~/project/hello_cargo$ cargo run
   Compiling hello_cargo v0.1.0 (/home/hagevvashi/project/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 0.23s
     Running `target/debug/hello_cargo`
Hello, world!
```
            - cargo run の前に build したりするのが正規の手順なのかも？
- ちなみに全く関係ないがリンカを Cargo の設定で変えることができるらしい
    - ref: https://github.com/rust-lang/cargo/issues/9673#issuecomment-877287067
        - ただしこの人の記載そのまま転記すると文法エラーがでるので正しい記法に修正する
```
[build]
rustflags = ["-C", "link-arg=--sysroot=/usr/bin/gcc"]
```


## 2024.01.01 - ca-certificates を install しないと https://sh.rustup.rs の curl リクエストからの sh 処理がうまく行ってなさそう

- 原因は不明
- コマンドはこれ `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain ${RUST_VERSION}`
- curl のオプションが悪い？
    - `--proto '=https'`
    - `--tlsv1.2`
    - `-sSf`
- ひとまず ca-certificates を install しておく

## 2024.01.01 - そもそもイメージ自体をキャッシュしないなら Entrypoint で useradd, groupadd する必要ない

### Why

- そもそものところから、コンテナイメージを作る際にユーザ名やグループ名が決まる場合であれば Dockerfile 内で useradd, groupadd を実行すればよいことに気づいた
- rustup コマンドに PATH を通したい場合はシェルにログイン時に export する必要があるので一旦 Entrypoint 内で実施しておく

### What

- Entrypoint の処理を Dockerfile に移す
- rustup コマンドへ PATH を通すのは Entrypoint で実施

### How

- --build-arg を用いて Dockerfile に変数を渡す
- Dockerfile 内で USER を用いてログインユーザを決める
- USER を用いているので、Entrypoint 内では gosu の引数に whoami の実行結果を返す

### refs

- https://qiita.com/legokichi/items/04fdafd3f55b03c7bb49

---

## 2023.12.31 - gosu で root になれない

### Context

Dockerコンテナを用いた開発でbind mountする場合、Dockerコンテナ側からファイル操作をするとユーザーやグループの関係でpermission errorが出て困ることが多い。その対策としてホスト側のグループとユーザを渡してDockerコンテナを作る際のEntrypoint内でuseraddコマンドとgroupaddコマンドを実行している。その後にgosuコマンドで渡されたユーザでdocker runで渡したコマンドを実行するようにしている。

### Why

- そのgosuで指定したユーザからgosuを実行してrootを指定した場合に下記エラーがでる
```
error: failed switching to "root": setgroups operation not permitted
```

### What

- 解決策として https://github.com/tianon/gosu/issues/11 で示されている chmod +s /usr/sbin/gosu を実行すると下記エラーが出る
```
error: "gosu" appears to be installed with the 'setuid' bit set, which is an *extremely* insecure and completely unsupported configuration! (what you want instead is likely 'sudo' or 'su')
```
- ソースコードを見ると、環境変数の値を見て一致しなかった場合（あるいはそもそも指定がなかった場合に）、setuidやsetgidのフラグを確認してエラーになるようにしていた
https://github.com/tianon/gosu/blob/b73cc93b6f5b5a045c397ff0f75190e33d853946/main.go#L55
- その環境変数と値を設定しておく 参考↓
https://github.com/tianon/gosu/blob/b73cc93b6f5b5a045c397ff0f75190e33d853946/Dockerfile.test-alpine#L28

### How

- DockerfileでENVで指定する
```
ENV GOSU_PLEASE_LET_ME_BE_COMPLETELY_INSECURE_I_GET_TO_KEEP_ALL_THE_PIECES="I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those moments will be lost in time, like tears in rain. Time to die."
```
