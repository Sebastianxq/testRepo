<h3>This file contains my interpretation for the terminology needed to effectively use github as a hub for program management.
Basically doing this in hope to better understand all the concepts and to eventually upload it into a github.io
website others in the future who may have the same issue.</h3>

todolist
<li>Add concept of staging</li>
<li>Fix terrible formatting</li>

<h1>Git Branching Introduction</h1>

<h2>Concept of Commits</h2>
A commit acts as an update for Git, when created, Git stores a 'commit' object that
contains a pointer to a snapshot of the content that you staged. This object contains
information like author, comments and other sorts of metadata and may contain none or 
more pointers to the parent commits that came before this one. In the case where a 
branch is merged (more on branches below) then there will be 2 or more pointers to 
each of the branche's previous commits. This allows a trail of snapshots similar
to, say a VM's snapshot history, allowing us an ability to view and even go back
to any major point in our history. 

In it's simplest form: a commit is a pointer with metadata that points to a tree
containing all your files.


<h2>Concept of Branches</h2>
A branch is much like a commit except one level higher. By default, git creates a
single branch, called "master". By default, this branch points to the last commit
that you make. You can create a new branch in git by typing the following command

<code>git branch BranchName</code>

This will create a new branch pointer that is pointing to your current commit.


<h2>Concept of HEAD pointer</h2>
This is yet another pointer (very painful to understand pre-cs3 I know) that keeps
track of the branch that you are currently on. The command shown above only created 
a new branch, it did not switch to using that branch. To switch to a different
branch, use the command below

<code>git checkout BranchName</code>

This will switch the HEAD pointer to your chosen branch. The reason one would 
want to do this is so that we can move the branch pointer forward with any commits
that we do while keeping all of our other branch pointers pointing to what they 
were pointing to previously. A benifit of moving this HEAD pointer is that with 
each movement that you do, it reverts to the contents within your directory to 
that commit's specific files, acting much a like, as previously mentioned with 
commits: a snapshot in a VM. Keep in mind that when you perform changes to your files 
and add a new commit in a scenario like this, the paths will diverge and create 
2 seperate branch paths, allowing essentially 2 instances of the same files. 

