---
desc: Ravenholdt theorycrafting community, latest simulation results and resources -based on SimulationCraft- for World of Warcraft rogues.
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

{% assign simulations = site.pages | group_by: "simulation" | sort: "name" %}
{% for simulation in simulations %}
{% unless simulation.name == '' %}
<h2>{{ simulation.name }}</h2>
<div class="row">
  {% assign gearsets = site.pages | where: "simulation", simulation.name | group_by: "gearset" | sort: "name" %}
  {% for gearset in gearsets reversed %}
  {% unless gearset.name == '' %}
  <div class="col-sm-6">
    <h3>{{ gearset.name }}</h3>
    <div class="list-group">
    {% assign specs = site.pages | where: "simulation", simulation.name | where: "gearset", gearset.name | group_by: "spec" | sort: "name" %}
    {% for spec in specs %}
    {% unless spec.name == '' %}
    {% for entry in spec.items %}
    {% if entry.fightstyle == nil or entry.fightstyle == "Single Target" %}
      <a class="list-group-item" href="{{ entry.url }}">{{ spec.name }}</a>
    {% endif %}
    {% endfor %}
    {% endunless %}
    {% endfor %}
    </div>
  </div>
  {% endunless %}
  {% endfor %}
</div>
{% endunless %}
{% endfor %}
