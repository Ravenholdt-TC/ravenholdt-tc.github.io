---
title: false
description: Ravenholdt theorycrafting community, latest simulation results and resources -based on SimulationCraft- for World of Warcraft rogues.
---

Ravenholdt Theorycrafting
=========================

This is the website of the Ravenholdt Theorycrafting Community! Here you can find our latest simulation results and resources.

Besides, the Rogue Theorycrafting community is happy to introduce you to our new community hub: The Ravenholdt-TC Organization on GitHub! This will let you follow what is going on behind the scenes. You can also contribute via the issues panel to suggest ideas and report bugs.

Here are links you may want to check out for further information:

- <a target="blank" href="https://github.com/Ravenholdt-TC/Rogue/projects/1">TC Dashboard</a> / <a target="blank" href="https://github.com/Ravenholdt-TC/Rogue/issues">Rogue Issues</a>
- <a target="blank" href="https://github.com/Ravenholdt-TC">Ravenholdt-TC GitHub Organization</a>
- <a target="blank" href="https://discord.gg/x3R9z9g">Ravenholdt Discord</a> for class discussion
- <a target="blank" href="http://www.ravenholdt.net/">Ravenholdt Website</a> for news and general rogue information

If you have any questions, feel free to visit the class Discord and contact Aethys or Mystler.

{% assign validCollections = "combinations, relics, trinkets" %}
{% assign simulations = site.documents | where_exp: "item", "validCollections contains item.collection" | group_by: "collection" | sort: "name" %}
{% for simulation in simulations %}
<h2>{{ simulation.name | capitalize }}</h2>
<div class="row">
  {% assign tiers = site.documents | where: "collection", simulation.name | group_by: "tier" | sort: "name" %}
  {% for tier in tiers reversed %}
  <div class="col-sm-6">
    <h3>{{ tier.name }}</h3>
    <div class="list-group">
    {% assign specs = site.documents | where: "collection", simulation.name | where: "tier", tier.name | group_by: "spec" | sort: "name" %}
    {% for spec in specs %}
    {% for entry in spec.items %}
    {% if entry.fightstyle == nil or entry.fightstyle == "Single Target" %}
      <a class="list-group-item" href="{{ entry.url }}">{{ spec.name }}<span class="update-date">{{ entry.lastupdate | truncatewords: 2 | remove: '...' }}</span></a>
    {% endif %}
    {% endfor %}
    {% endfor %}
    </div>
  </div>
  {% endfor %}
</div>
{% unless forloop.last %}
<hr>
{% endunless %}
{% endfor %}
