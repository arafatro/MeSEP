import glob, os

def scanfolder():
    for path, dirs, files in os.walk('/Users/arafatr/Documents/SPIDER2_local/misc/'):
        flag_faa = 0
        for f in files:
            if f.startswith('PSSM.'):
                flag_faa  = 1
                faa_file_path = os.path.join(path,f)
 
                print ("Calling script")
                os.system("./pred_pssm.py" + " -a "+ faa_file_path)
                flag_faa  = 0


scanfolder()
