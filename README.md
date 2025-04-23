# Crear repositorio inicial
git init
git add .
git commit -m "Commit inicial del sistema de farmacia"
git branch -M main
git remote add origin https://github.com/tu-usuario/sistema-farmacia.git
git push -u origin main

# Crear rama de desarrollo
git checkout -b develop
git push -u origin develop

# Para una nueva funcionalidad (ejemplo: módulo de inventario)
git checkout develop
git checkout -b feature/modulo-inventario
# (Desarrollo del módulo)
git add .
git commit -m "Implementación del módulo de inventario"
git push -u origin feature/modulo-inventario

# Integrar la funcionalidad a develop
git checkout develop
git merge --no-ff feature/modulo-inventario
git push origin develop

# Preparar una versión
git checkout develop
git checkout -b release/v1.0.0
# (Ajustes finales, corrección de bugs menores)
git push -u origin release/v1.0.0

# Finalizar la versión
git checkout main
git merge --no-ff release/v1.0.0
git tag -a v1.0.0 -m "Versión 1.0.0"
git push --tags
git checkout develop
git merge --no-ff release/v1.0.0
git push origin develop

# Para un hotfix
git checkout main
git checkout -b hotfix/error-inventario
# (Corrección del error)
git push -u origin hotfix/error-inventario
git checkout main
git merge --no-ff hotfix/error-inventario
git tag -a v1.0.1 -m "Corrección error en inventario"
git push --tags
git checkout develop
git merge --no-ff hotfix/error-inventario
git push origin develop
