% Version Control:  Why, What and How
% Ted Stern
% February 23, 2012

# Why give this talk?

> - Version control is 'hard', so not used.
> - Copying seems good enough
> - Informal development postpones version control pain
> - You need to evangelize VCS to your group
> - People do not understand branching
> - Version Control Software (VCS) as part of Software Configuration Management

# A version control story

> - A project was already maintained under Subversion, but was transferred to another user.
> - The new user abandoned all existing history and started fresh with a new Subversion repo.
> - What is wrong with this picture?
> - Cannot re-create previous versions.
> - Any lessons learned have been lost.
> - What was broken that needed fixing?
>     + Most modern VC software can move/rename files

# Levels of abstraction

> - Typewriter and paper
> - Disk and Editor
> - Backup files
> - Backup directory snapshots / archives
> - *Save only differences*
> - Track directories and name-changes

See [The Git Parable](http://tom.preston-werner.com/2009/05/19/the-git-parable.html).

# Reasons

> - Backup and Restore
> - Collaboration
> - Short/Long-term undo
> - Tracking:
>      + Changes
>      + Ownership
> - Branching / Merging / Third-party software
> - Refactoring

# Terms

> - Repository
> - Client / Server
> - Working Copy (checkout)
> - Trunk / Mainline

# Basic actions

> - Revision
> - Head
> - Add
> - Commit (checkin)
> - Update (pull)
> - Revert

# Advanced actions

> - Branch
> - Diff
> - Merge
> - Conflict
> - Resolve
> - Refactor
> - See [Basic Guide to Version Control](http://betterexplained.com/articles/a-visual-guide-to-version-control/)

# Non-obvious

> - Track only the source, not the build products.
> - Track directories, binaries, file renaming
> - Group changes with atomic commits

# Basic strategy

> - Checkout working copy
> - Edit some files
> - Save file(s)
> - Stage commit
> - Commit

# Branch/Merge, a "meta" version of checkout/change/save/commit

> - Mainline trunk for development.  The trunk should always "work".
> - Branch for any change bigger than "a day".
> - Branch for bug fixes.
> - Branch for features.
> - Branch for feature-freeze / release.
> - Track third-party source on its own branch and sub-branches.
> - Tags should be cheap.  Tag specific versions or branch locations.

# When to branch?  Different philosophies

> - Branching is hard, [treat it like adopting a puppy](http://www.ericsink.com/scm/scm_branches.html)
>     + Branching under CVS:  more like adopting a baby?
> - [Branching may be hard, but better to branch more often](http://tech.puredanger.com/2008/06/03/release-and-branching-strategies/)
> - Subversion:  Easier, but still tricky
>     + [Collabnet strategy comparison](http://blogs.collab.net/subversion/2007/11/branching-strat/)
> - Branch early and often:
>     + Branching under Git:  Whee!  Too easy?  Just clone and start working.
>     + [Git branching](http://gitguru.com/2009/02/18/branching-strategies-overview/)

# Example

![Branching on bug, feature release](RHQ_ReposModel.png "Source:  http://www.rhq-project.org/pages/viewpage.action?pageid=5341192")

# The right way to merge:

> - Merge from parent to child often
>     + to keep track of orthogonal changes and avoid conflicts.
> - One final merge from parent to child,
>     + before reintegrating merge from child back to parent again.

# Issue Tracking

It is A Good Thing to coordinate issue tracking with Version Control.

> - Ticket can track multiple changes on a branch, for bug, feature, release.
> - If you have good issue tracking and mod integration, you can tie together
>   a set of mods into one composite mod.
> - [Wikipedia:  Comparison of Issue Trackers and VCS integration](http://en.wikipedia.org/wiki/Comparison_of_issue-tracking_systems#Revision_control_system_integration)
>     + NB:  Bugzilla, Trac integrate with Subversion, Perforce, Git, Mercurial, CVS.
>       Jira works with all those and also ClearCase.  Worth investigating.

# How you do it

There is no best Version Control software, and you can't really say that there
is one until each of those tasks is easy, intuitive, and architecture
independent.

> - Establish a framework.
>      + [SLUGG scripts](http://aerowiki.ca.boeing.com/RandomWiki/HowTo/UseConfigurationManagementScripts/)

# Centralized vs. Distributed

> - [Subversion vs. Git](http://www.codeforest.net/git-vs-svn)

# Centralized repository:  Subversion

- Central reference
    + ^/project/trunk/<src>
    + ^/project/branches/<branch>/
    + ^/project/tags/<tag>/
    + svn cp ^/project/trunk ^/project/branches/<branchname>
- Tools in OSS Toolkit:
    + TortoiseSVN (Windows)
    + RapidSVN (Linux)

- Recommended:  svn+ssh access through single account

# Distributed development:  Git

- Distributed repositories:
    + git clone URL directory
    + cd directory
    + *Working copy contains a copy of entire repository*
- "Branch" can be considered as either clone or a branch within the local Git repo.
- Issues:  Whose repo is the master?
- Tools:
    + TortoiseGit (Windows)
    + Linux:
         - git gui
         - gitk

# Issue tracking notes

- Trac
    + Works with Subversion, Git
    + Simpler than Bugzilla
    + In OSS Toolkit
    + Setting up a Trac repository with Overflow

- GitHub
    + Wave of future?
    [Wired article, 02/21/2012](http://www.wired.com/wiredenterprise/2012/02/github/all/1)
    + Built in issue tracking, makes branching/merging/collaboration easy
    + Enterprise license available ($250 per seat, $3K to $10K unlimited?).
    + Restricted to Git, but maybe not so bad?

# Conclusions, part 1

> - Pick the VCS that is closest to the model for your project (centralized vs. distributed; consolidated source vs. lots of forking).

> - Use an issue tracker that automatically integrates with your VCS.
> - [Comparison of issue trackers](http://en.wikipedia.org/wiki/Comparison_of_issue-tracking_systems)
> - Wrap abstract actions in scripts
> - If you have to wrap VCS in complex helper scripts, it is not the best tool for your project, though it may be the best currently available.
> - Ask yourself:
>     + Does this tool help me more than it gets in the way?  O(10X) benefit
>       per hurdle.
>     + Architecture independence and interoperability?
>     + Strong community?  Bigger base = better development
>     + Is there a way out?

# Summary

- Understand branching and merging.
- Don't freeze VCS/SCM:  be ready to change to a better method **when**, *not
  if* it becomes available.
- Ensure that you can convert your existing version history and
  issue tracking to new systems.
