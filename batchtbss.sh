printf '\nNavigate to the directory that contains all directories containing FA .nii.gz files.\n'
printf 'If you are not there, exit the program NOW.\n'

for D in *;
  do (cd $D && /home/james/tbssconveyor.sh);
done

