# Run arxiv-reader on GitHub Actions

Converts Arxiv papers to WAV files on GitHub's Actions servers, and uploads the files as artifacts.

This repo allows me to run [arxiv-reader](https://github.com/AI-Guru/arxiv-reader) on GitHub Actions.
If you fork this repo, you too should be able to convert papers to audio.
This will consume your allotted GitHub Actions minutes quota!

## How to Convert an Arxiv Paper to Audio

1. Get the Arxiv ID: `https://arxiv.org/abs/<id>`. (Usually, IDs look something like `yymm.nnnnn`.)
2. Go to the "Run arxiv-reader on Arxiv paper" action: click on the Actions tab of this repository, and then click on the "Run arxiv-reader on Arxiv paper" action in the left-hand column.
3. Run the workflow: click on the "Run workflow" dropdown near the right side of the page and enter the Arxiv ID. Click "Run workflow" button.

## Note on using Arxiv URLs

Prepend arxiv urls with export, as detailed here:
<https://arxiv.org/denied.html>
