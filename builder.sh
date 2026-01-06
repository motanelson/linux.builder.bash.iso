printf "\033c\n "

                mkdir ./tmp/root 2> /dev/null
                printf "y\n" | rm ./tmp/root/*
                printf "y\n" | rm ./tmp/root/*.*
echo '.........................................'
printf "\033[40;37m\ngive me the files to include in main root ? "
read a
for b in $a
do
    cp $b ./root/
done
echo '.........................................'

printf "\033[40;37m\ngive me iso image name ? "
read h
chmod 777 ./tmp/root/*
echo '.........................................'
cp isolinux.bin ./tmp/root 2> /dev/null
cp isolinux.cfg ./tmp/root 2> /dev/null
cp vmlinuz ./tmp/root 2> /dev/null
cp initrd.gz ./tmp/root 2> /dev/null
chmod 777 ./tmp/root/*

genisoimage -o "$h" -input-charset utf-8 -b "isolinux.bin" -no-emul-boot -boot-load-size 4  -boot-info-table "./root"
chmod 777 $h
