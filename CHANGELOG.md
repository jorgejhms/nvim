# Changelog

## 2024.10.1

### Agregado

- Se agregó `<Leader>co` para organización de importaciones en typescript y `<Leader>cR` para remoción de importaciones innecesarias.

### Cambios

- Se restauró `Luasnip` en lugar de `nvim-snippets` ya que este último no funciona correctamente con `friendly-snippets`.

## 2024.10.0 - Cleaner

- Limpieza general de configuración.
- Eliminando plugins superfluos o innecesarios
- Basada principalmente en `mini.nvim`

## 2024.06.01

### Agregado

- `mini.tabline` se oculta cuando solo hay un buffer abierto.
- `mini.git` y `mini.diff` remplazan a gitsigns.

## 2024.06.0

### BREAKING:

- Actualizado a Nvim 0.10+
- Se agrega soporte para pistas en línea (inlay hints) para typescript/javascript y lua.
- Atajos de teclado para cerrar ventana `<Cmd-w>` y guardar archivos `<Cmd-s>`.

### Agregado

- Colores en base16 para uso de `mini.base16`.
- Selección incremental usando `<C-Space>`.
- Archivos soportados en `emmet_ls`.

## Eliminado

- Configuración antigua de `lualine`.

### Correcciones

- Mensajes de error al iniciar nvim por indicador de Copilot.
- Mensajes de diagnóstico en configuración de `mini.pick`.
- Combinaciones de teclas faltantes en `mini.pick` para sugerencias ortográficas y selector de Color.

## 2024.05.06

### Agregados

- Autocomando para reajustar tamaño de paneles al redimensionar la ventana de Nvim.
- `mini.basic`.
- Agregando LSP `emmet_ls` y `mdx_analyzer`
- Agregando `mini.colors`, `mini.base16` y temas de colores.
- Agrega configuración personalizada de `mini.statusline` con iconos para visualizar el estado de Copilot, corrección ortográfica, ajuste de línea y registro de macros.

### Cambios

- Eliminado `indentblankline`
- Desactiva animaciones al hacer scroll con el mouse.
- Eliminando colores no compatibles.
- Establece ajuste de línea por defecto.

## 2024.05.05

### Agregados

- `noice`: Mejoras interfaz.

## 2024.05.04

### Agregados

- Soporte básico para archivos `.mdx`.
- `dressing.nvim`.
- `indentblankline`.

### Cambios

- Remplazo `mini.statusbar` y `mini.tabline` por `lualine`.
- Símbolos de `gitsigns` e `mini.indentscope`.
- Símbolos de diagnóstico en `lualine`.
- Estilo terminal flotante `lazygit`.

## 2024.05.03

### Agregados

- `Python Venv Selector`: Permite seleccionar el Venv de Python del proyecto.
- `eldrich`: Tema de colores

### Cambios

- Usa `radian` como terminal R.

## 2024.05.02

### Agregados

- `Tmux-Nvim-Navigator`: Permite cambiar de paneles con Tmux más rápidamente.
- `ariake`: Tema de colores.
- Configuración para Neovide.
- (Octo.nvim): Combinación de teclas `<Leader>oil` para listar issues propios.

### Cambios

- Establece `<C-c>` para cancelar autocompletado en lugar de `<C-e>`.
- Uso de `local map` en lugar de `vim.keymap.set`.

### Correcciones

- Corrige comando para llamar `Pick diagnostics`.

## 2024.05.01

### Agregados

- Muestra nombre de terminal al abrir `Lazygit`.
- Muestra símbolos en `todo-comments`.
- Muestra símbolos de diagnósticos.

## 2024.05.0 - MINIMAL

### BREAKING

- Migrando configuración a `Mini.deps`
- Remplazando `lualine` y `tabline` por `Mini.statusline` y `Mini.tabline`
- Remplazando plugin `lazygit` por `Toggleterm`
- Remplazando `which-key` por `mini.clue`
- Remplazando `telescope` por `mini.pick`

### Agregados

- Nuevo keymap `<Leader>bo` para cerrar otros buffers
- Agregando `mini.splitjoin`
- Agregando `rainbow-csv`
- Agregando `mini.animate`, `mini.braketed`, `mini.sessions` y `mini.starter`
- Agregando `R-nvim`
- Agregando soporte lenguage Astro

### Cambios

- Eliminado bordes en ventanas de autocompletado
- Cambio caracter de `virt-column`
- Actualizando keymaps de copilot

## 2024.04.1

- Eliminado colores repetidos.
- Remplazando Lualine con Mini.statusline y Mini.tabline
- Remplazando plugin Lazygit con terminal personalizada con Toggleterm
- fix: Telescope muestra rutas (paths) usando la opción 'smart'
- Eliminando bordes de menus de autocompletado.
- Agregando stylelua.tom para mantener estilos de archivos lua.
- Cambiando a tokyonight como tema por defecto.
- Gitsigns: Agregando keymaps basados en Lazyvim.

## 2024.04.0 - Retomando configuración personal

- Completando cambios principales
