##sudo mount csclvault1.csmc.edu:/ifs/common/  /mnt/hpc/  -o user=genomics
sudo mount //csclvault1.csmc.edu/genomics-archive /mnt/genomics-archive -o  user=svc_DNASequencer,password=q8oY65*z,dom=csmc


#NEW
sudo mount -t nfs nfs.researchCAMPUS.csmc.edu:/genomics-core /mnt/hpc2 -o user=genomics