printf "\033c\n "

                umount /mnt/rams 2> /dev/null
                rm initrd 2> /dev/null
                cp init initrd
                mkdir /mnt/rams 2> /dev/null
                mount -o loop initrd /mnt/rams
echo '.........................................'
printf "\033[40;37m\ngive me the files to include in main root ? "
read a
for b in $a
do
    cp $b /mnt/rams
done
echo '.........................................'
chmod 777 /mnt/rams/*
umount /mnt/rams  2> /dev/null
printf "\033[40;37m\ngive me iso image name ? "
read h

echo '.........................................'
rm initrd.gz 2> /dev/null
gzip initrd 2> /dev/null
cp initrd.gz ./root/isolinux/
genisoimage -o "$h" -input-charset utf-8 -b "isolinux/isolinux.bin" -no-emul-boot -boot-load-size 4  -boot-info-table "./root"
chmod 777 $h
