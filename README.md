<!--
GA3 README template.
- Add your answers to each question's section below.
- For each question where we want you to add your commands,
  put the command(s) you ran in the terminal in the corresponding ```bash code block.
- Where we want to see a command's output, there is a plain ``` code block
  right below the command block: paste the output there.
- You don't need to paste the contents of your scripts into this file:
  we will look at the scripts in your `scripts` dir directly
  (so make sure you commit them!).
- Delete instructional comments like this one as you go.
-->

# GA3 answers - Nabina Karki

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files

<!-- No command/output needed -- you can make dirs however you want, and the copy commands are provided. -->

### 2: Initialize a Git repository, and commit the README and `.gitignore`

<!-- No command/output needed here -- we check the repo directly. -->

### 3: Commit throughout the assignment

<!-- No command/output needed here -- we check your commit history directly. -->

------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`

<!-- No need to paste the script: we'll look at scripts/echo.sh directly. -->

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`): I think this will print $1: Oct07, $2: Oct08, $3: unbound variable

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`): I think this will print $1: Oct07, $2: Oct08, $3: Oct09

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`): I think this will print $1: Oct07, $2: Oct08, $3: Oct 09 Oct10

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`): I think this will print $1: result/fastqc/S63_R1_fastqc.html $2: result/fastqc/S63_R2_fastqc.html $3:result/fastqc/S64_R1_fastqc.html 

### 5: Run `echo.sh` and compare with your predictions

```bash
bash scripts/echo.sh Oct07 Oct08
```

The output of the command was:

```   
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable      
```

```bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

The output of the command was:

```
Oct07
Oct08
Oct09
Finished         
```

```bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

The output of the command was:

```
Oct07
Oct08
Oct09 Oct10
Finished      
```

```bash
bash scripts/echo.sh results/fastqc/*.html
```

The output of the command was:

```      
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished
```

*Answer*: Which output (if any) differed from your prediction, and why? **Yes, my predictions for 2nd, 3rd and 4th commands were different because I didn't realize that echo "finished" will print as it is beacuse this was not a defined variable and it will print as finished in the end** 

### 6: Write the `printline.sh` script

<!-- No need to paste the script: we'll look at scripts/printline.sh directly. -->

### 7: Test `printline.sh` twice

Test 1:

```bash
[nabinak77@p0220 GA3]$ bash scripts/printline.sh data/metadata.tsv 2
```

The output of the command was:

```
S82     10dpi   cathemerium         
```

Test 2 (with redirection), and checking the contents of the output file:

```bash
[nabinak77@p0220 GA3]$ touch results/S82.txt
[nabinak77@p0220 GA3]$ bash scripts/printline.sh data/metadata.tsv 2 > results/S82.txt 
[nabinak77@p0220 GA3]$ cat results/S82.txt 
```

The output of the command that checks the file contents was:

```    
S82     10dpi   cathemerium     
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

```bash
[nabinak77@p0220 GA3]$ apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc --help
```

<!-- You don't need to paste the MultiQC help output -->

The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

```bash
multiqc --outdir results/multiqc results/fastqc
```

### 10: Write the `multiqc.sh` script

<!-- No need to paste the script: we'll look at scripts/multiqc.sh directly. -->

### 11: Run `multiqc.sh`

Code to run the script:

```bash
[nabinak77@p0220 GA3]$ bash scripts/multiqc.sh 
```

<!-- You don't need to paste the MultiQC logging output -->

*Answer*: Number of FastQC reports MultiQC found: 44

*Answer*: Does that match what you expected? Why/why not?
I think this matched the number beacuse it counted both R1 and R2 fastqc files. 

### 12: Make `multiqc.sh` accept arguments, and rerun it

<!-- No need to paste the script: we'll look at scripts/multiqc.sh and its Git history directly. -->

Code to rerun the script:

```bash
[nabinak77@p0220 GA3]$ bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- No need to paste any output -->

### 13: Differences between the two MultiQC runs

*Answer*: I think there was 88 files before and with second run there was 89 files and there is difference in the name it renamed with new number. I think its because there was already another file of the same name and to not over write it created new one. 

------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does): I believe the options is output and first argument probably is the format we want it to be converted and second argument is the existing format. 

*Answer* (how does Pandoc know which output format to produce?): I think the option -o directs it so may be thats why the ouput or wanted format is used as argument just after option -o. 

### 15: Render your README to PDF and HTML

```bash
pandoc -o README.pdf README.md
```

- Command to render to HTML:

```bash
#pandoc -o README.html README.md
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not?

I don't think so it should be commited to my git repo because I already have the markdown files already commited and if I wanted to convert I will have the markdown file to convert when needed. If we are converting to share with other who does not need it may be we can convert when needed. 


### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file: I observe that with long url links was cut off may be to accomodate the margin. The pdf file didn't print everything in the line for my answer of q9 where I had command for multiqc. 

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 19: Connect your local repo to GitHub, and push

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 20: Create an Issue to tag the instructors

<!-- No command/output needed here -- we check your GitHub repo directly. -->

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained): I think it helps to compare multiple samples together.



*Answer* (one thing you're confused about): This is helpful for multiple comparison but in graphs like histograms and quality score, the graph line overlapped so how can we see individual report of particular sample. 

### 22: Pandoc versions

```bash
pandoc -v
```

The output of the command(s) was:

```  
pandoc 2.14.0.3
Compiled with pandoc-types 1.22.1, texmath 0.12.3.3, skylighting 0.10.5.2,
citeproc 0.4.0.1, ipynb 0.1.0.1
User data directory: /users/PAS3493/nabinak77/.local/share/pandoc
Copyright (C) 2006-2021 John MacFarlane. Web:  https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.       
```

*Answer*: Is the Pandoc version available by default the most recent one?

No, the default available one is not the recent one.

*Answer*: Which Pandoc version are you using after loading the module?

pandoc 3.6.4
Features: +server +lua
Scripting engine: Lua 5.4
User data directory: /users/PAS3493/nabinak77/.local/share/pandoc
Copyright (C) 2006-2024 John MacFarlane. Web: https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.