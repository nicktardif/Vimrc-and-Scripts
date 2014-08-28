import os
import shutil
from mutagen.mp3 import MP3

filetype = '.mp3';

for fullname in os.listdir('.'):

    # Make sure it's the correct file type
    if((os.path.splitext(fullname)[1]) != filetype):
        continue

    file = MP3(fullname)

    try:
        # Get the metatdata information
        # Strip out the null values and extra dashes
        artist  = str(file['TPE1']).rstrip('\0').replace('/', '')
        album   = str(file['TALB']).rstrip('\0').replace('/', '')
        title   = str(file['TIT2']).rstrip('\0').replace('/', '')
    except KeyError:
        print str(fullname) + ' is missing some metadata, skip.'
        continue

    # Figure out which directory it's going to
    directory = artist + '/' + album

    # Create the directory if it doesn't already exist
    if not os.path.exists(directory):
        os.makedirs(directory)

    # Move the file to the correct directory
    shutil.move(fullname, directory + '/' + title + filetype)

    print directory + '/' + title + ' moved!'
