---
title: "Nanoc + ZSH = Awesomeness"
created_at: 2012-10-03 15:11:57 +1000
kind: article
published: true
---

Static blogging engines are [the only way to go](http://inessential.com/2011/03/16/a_plea_for_baked_weblogs), not just for the reduction of server resources, but also for the unlimited ability for customization (and not being beholden to a behemoth like WordPress). This blog - and indeed this whole site, is built with the totally awesome [Nanoc](http://nanoc.stoneship.org/) static site generator. Setting up and using Nanoc's tools is already super easy, but I wanted to make them even easier and more enjoyable to use - so I've [created a simple ZSH plugin](https://github.com/josh-/oh-my-zsh/tree/master/plugins/nanoc) that includes autocompletion and aliases for common tasks.

<!-- more -->

Autocompletion is invoked like all ZSH completions, type "nanoc " and then hit Tab - you then use Tab to cycle through available functions and Return to make a selection.

<img src="/images/ZSH_Autocompletion.png" alt="Nanoc autocompletion in ZSH" style='margin: 0px auto; max-width: 100%'>

On top of the autocompletion, aliases provide even easier access to common tasks. At the time of writing they include:

* `n`   = "nanoc"
* `na`  = "nanoc autocompile"
* `nco` = "nanoc compile"
* `nci` = "nanoc create_item"
* `ncl` = "nanoc create_layout"
* `ncs` = "nanoc create_site"
* `nd`  = "nanoc deploy"
* `nv`  = "nanoc view"
* `nw`  = "nanoc watch"

So, for example - to autocompile a site, you need only type "na".

I use the [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh) framework for managing my shell configuration, so I've forked that and added the plugin to my fork.

Unfortunately, after a month my pull request still hasn't been accepted - the project currently has 432 open pull requests so this is hardly surprising. If you're already running Oh-My-Zsh, the best way to download the plugin is to fetch it from my fork and merge it into your current configuration:

~~~
git remote add josh git://github.com/josh-/oh-my-zsh.git
git fetch josh
git merge josh/master
~~~
{:.language-sh}

These commands will download the changes in my fork and merge them into your custom Oh-My-Zsh directory, keeping all changes you've made intact. Then just add nanoc to your `.zshrc` plugins.

I hope to continue improving this plugin - if you have any suggestions, comments or questions, please feel free to [contact me](/about/).

---

**Update:** The plugin has been merged into the master branch of Oh-My-Zsh, so all you have to do now is update your Oh-My-Zsh config with:
    
~~~
cd ~/.oh-my-zsh
git pull origin master
~~~
{:.language-sh}
