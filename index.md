---
---

Ravenholdt Theorycrafting
=========================

<div class="list-group">
  {% for page in site.pages %}
  {% if page.title %}
  {% unless page.donotlist %}
  <a title="{{ page.title }}" href="{{ page.url }}" class="list-group-item">{{ page.title }}</a>
  {% endunless %}
  {% endif %}
  {% endfor %}
</div>

About Us
--------

This is the website of the Ravenholdt Theorycrafting Community! Here you can find our latest simulation results and resources.

Besides, the Rogue Theorycrafting community is happy to introduce you to our new community hub: The Ravenholdt-TC Organization on GitHub! This will let you follow what is going on behind the scenes. You can also contribute via the issues panel to suggest ideas and report bugs.

Here are links you may want to check out for further information:

- <a target="blank" href="https://github.com/Ravenholdt-TC/Rogue/projects/1">Dashboard</a>
- <a target="blank" href="https://github.com/Ravenholdt-TC/Rogue/issues">Issues</a>
- <a target="blank" href="https://github.com/Ravenholdt-TC">GitHub Organization</a>
- <a target="blank" href="https://discord.gg/x3R9z9g">Ravenholdt Discord</a> for class discussion

If you have any questions, feel free to visit the class Discord and contact Aethys or Mystler.
