---
layout: page
title: About
permalink: /about/
---

Real World Go aims at releasing articles, tutorials, and screencasts targeted for applications in the real world.

## Who's Behind This?

{% for author in site.data.authors %}
- Name: {{ author.name }}
- GitHub: [@{{ author.github }}](https://github.com/{{ author.github }})
- Twitter: [@{{ author.twitter }}](https://twitter.com/{{ author.twitter }})
- Google Plus: [{{ author.gplus }}](https://plus.google.com/{{ author.gplus }})
{% endfor %}