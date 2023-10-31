---
- name: Install Lazyvim
  become: no
  block:
    - name: Check init.lua exists
      stat:
        path: "{{ user.home }}/.config/nvim/init.lua"
      register: file_exists

    - name: Check if require("config.lazy") is in init.lua
      lineinfile:
        path: "{{ user.home }}/.config/nvim/init.lua"
        line: 'require("config.lazy")'
        state: present
      check_mode: yes
      register: line_exists
      failed_when: (line_exists is changed) or (line_exists is failed)

    - name: Clone the lazyvim repo
      git:
       repo: https://github.com/LazyVim/starter
       dest: "{{ user.home }}/.config/nvim"
       clone: yes
       update: yes
      when: not file_exists.stat.exists or line_exists.failed

    - name: Ensure the .git dir for the lazyvim starter is absent
      ansible.builtin.file:
          state: absent
          path: "{{ user.home }}/.config/.nvim/.git/"
