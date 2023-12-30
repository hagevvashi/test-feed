## gosu で root になれない

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