# frp

Init
```
bash init.sh
cd source
```

Linux Build
```
rm -rf bin
make
cd bin 
tar -czvf frp_linux_amd64.tar.gz .
mv frp_linux_amd64.tar.gz ../
cd ..
```

Windows Build
```
rm -rf bin
export GOOS=windows
export GOARCH=amd64
make
cd bin
mv frps frps.exe
mv frpc frpc.exe
zip -q -r frp_windows_amd64.zip .
mv frp_windows_amd64.zip ../
cd ..
```
