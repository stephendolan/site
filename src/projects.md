---
layout: default
title: Projects
---

<ul>
  {% for project in collections.projects.resources %}
    <li> {{ project.title }} </li>
  {% endfor %}
</ul>
