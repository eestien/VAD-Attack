# Convert all .flac files within this folder to .wav files and than remove .flac

find . -iname "*.flac" | wc

for flacfile in `find . -iname "*.flac"`
do
    ffmpeg -y -f flac -i $flacfile -ab 64k -ac 1 -ar 16000 -f wav "${flacfile%.*}.wav"
    rm -f $flacfile
done
