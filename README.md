# tinysshd-jumpbox
Docker container to be used as a tinysshd jumpbox

# usage

You need to mount a dir containing a file named `authorized_keys` (list of public keys) to `/keys-src` on the container.

```
docker run -v /dir/containing/authorized_keys:/key-src -p 22:22 bentastic27/tinysshd-jumpbox
```

Per tinysshd it will only work with ed25519 keys. So you will need to generate with something like following:

```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519
```

Once you put the public key generated from the last command into the aforemented `authorized_keys` file and mount it appropriately, this will work:

```
ssh -i .ssh/id_ed25519 root@localhost
```
