
import os
from pathlib import Path
import pyuac

'''
Need to install some packages for this

pip install pyuac
pip install pypiwin32

If we end up adding more python utils, it might be worth it to set up a virtual env to manage it, but not needed immediately
'''

def main():
    src = Path.cwd() / Path("orbital-laser")
    dst = Path(os.getenv('APPDATA')) / "Factorio" / "mods" / "orbital-laser"
    os.symlink(src, dst, target_is_directory = True)

if __name__ == "__main__":
    if not pyuac.isUserAdmin():
        print("Re-launching as admin!")
        pyuac.runAsAdmin()
    else:        
        main()