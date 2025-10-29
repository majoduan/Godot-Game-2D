# Proyecto: Godot2 — Desarrollo de Juegos Interactivos

Resumen
-------
Repositorio de ejemplo para ejercicios y proyectos del curso "Desarrollo de Juegos Interactivos" (8vo semestre). Contiene escenas, scripts y recursos para prototipado y prácticas con Godot.

Requisitos
---------
- Godot Engine 4.x (recomendado) o 3.5+ (ajustar según compatibilidad de proyecto)
- Sistema operativo: Windows / macOS / Linux
- Recursos opcionales: editor de código (VS Code, Rider, etc.)

Instalación
---------
1. Clonar o descargar el repositorio en una carpeta local.
2. Abrir Godot y seleccionar "Import" o "Open" apuntando al archivo del proyecto (`project.godot` o `project.tres` según versión).
3. De ser necesario, actualizar rutas de assets en el panel de import.

Ejecutar
-------
- Abrir Godot, seleccionar la escena principal (por defecto: `scenes/main.tscn`) y pulsar Play.
- Para exportar, configurar ajustes de exportación desde Project → Export.

Estructura del repositorio
---------
- `scenes/` — escenas principales (.tscn / .scn)
- `scripts/` — GDScript/C# scripts
- `assets/` — imágenes, sonidos y otros recursos
- `docs/` — notas de clase y recursos didácticos
- `project.godot` — archivo de proyecto (Godot 3.x) o `project.tres` (Godot 4.x)

Controles y gameplay (ejemplo)
---------
- Movimiento: WASD / Flechas
- Saltar: Barra espaciadora
- Acción/Interactuar: E
(Ajustar según la escena/proyecto concreto)

Buenas prácticas
---------
- Mantener scripts y escenas moduladas por funcionalidades.
- Versionar assets grandes fuera del repositorio (LFS) si es necesario.
- Documentar cambios importantes en el historial (CHANGELOG.md).

Contribuciones
--------
- Abrir issues para bugs o propuestas.
- Crear pull requests con descripciones claras y ramas específicas.

Licencia y créditos
---------
- Indicar licencia del proyecto (ej. MIT) en `LICENSE`.
- Atribuir recursos externos según sus requisitos de licencia.

Contacto
--------
- Incluir nombre y correo del autor/instructor en `AUTHORS.md` si corresponde.

Notas finales
--------
Adaptar este readme al contenido real del proyecto (escenas, controles y dependencias) antes de compartir o entregar.