#!/bin/bash

# Ir al directorio del repo local
cd "/f/uni/UOC - Ingeniería Informática/UOC - Ingeniería Informática"

# Hacer un fetch y merge con mensaje para evitar abrir editor
git fetch origin main
git merge origin/main --allow-unrelated-histories -m "Merge remote-tracking branch 'origin/main'"

# Elimina lock si existe
if [ -f .git/index.lock ]; then
  echo "Eliminando lock file .git/index.lock"
  rm -f .git/index.lock
fi

#Lista completa de carpetas a subir
FOLDERS=(
  "Administración de redes y sistemas operativos"
  "Administración y gestión organizaciones"
  "Algebra"
  "Ampliación de estructura y tecnología de Computadores"
  "Análisi i Diseño con Patrones"
  "Análisis Matemático"
  "Aprendizaje computacional"
  "Arquitectura de Base de Datos"
  "Arquitectura de computadores"
  "Arquitecturas de computadores avanzados"
  "Autómatas y gramáticas"
  "Comercio electronico"
  "Competencia Comunicativa para Profesionales de las TIC"
  "Compiladores"
  "Criptografia"
  "Diseño de Sistemas Operativos"
  "Diseño de estructura de datos"
  "Diseño de redes de computadores"
  "Diseño_Programacion_Orientada_Objetos"
  "Diseño_de_BBDD"
  "Estadística"
  "Estructura de Computadores"
  "Estructura de redes de computadores"
  "Fundamentos Fisicos de la Informatica"
  "Fundamentos de Computadores"
  "Fundamentos de Programación"
  "Fundamentos de sistemas de informacion"
  "Gestión de Proyectos"
  "Gestión funcional de servicios de SITI"
  "Grafos y Complejidad"
  "Ingenieria de requisitos"
  "Ingenieria del Software"
  "Ingenieria del Software de Componentes y Sistemas Distribuidos"
  "Ingles I"
  "Ingles II"
  "Iniciación a las Matemáticas para la Ingeniería"
  "Iniciativa Emprendedora"
  "Integración de Sistemas de Información"
  "Inteligencia Artificial"
  "Interacción persona ordenador"
  "Lógica"
  "Master"
  "Mineria de Datos"
  "Minor ADE"
  "Minor diseño web"
  "Minor programación Web"
  "Planificación y uso estratégico de SI"
  "Practicas de Programacion"
  "Projecte de Desenvolupament de Programari"
  "RAEP"
  "Redes y Aplicaciones de Internet"
  "Representación del conocimiento"
  "Seguridad en redes de computadores"
  "Sistemas Distribuidos"
  "Sistemas empotrados"
  "Sistemas operativos"
  "Trabajo de Equipo en RED"
  "Trabajo de Fin de Grado"
  "Uso de Bases de Datos"
  "Uso sistemas información en las organizaciones"
)

# Sube carpeta por carpeta
for folder in "${FOLDERS[@]}"; do
  echo "Subiendo carpeta: $folder"

  if [ -d "$folder" ]; then
    echo "Carpeta encontrada: $folder"
  else
    echo "Carpeta no encontrada: $folder"
    continue
  fi

  git add "$folder"
  git commit -m "Add folder: $folder"

  if [ -f .git/index.lock ]; then
    echo "Lock file quedó activo. Lo borro..."
    rm -f .git/index.lock
  fi

  echo "Push..."
  git push origin main || { echo "Fallo en push. ¡Revisa si es demasiado grande o usa Git LFS!"; exit 1; }
done

echo "¡Script terminado!"
