
Table Libro {
  Codigo integer [primary key]
  Titulo varchar
  Autor varchar
  Fecha_Publicacion timestamp
  Genero_id integer
  Disponibilidad boolean
  Seccion_id integer
}

Table Seccion {
  id_Seccion integer [primary key]
  Nombre varchar
  Ubicacion_id integer
  tipo_id integer
  Bibliotecario_id integer
}

Table Bibliotecario{
  ID_Bibliotecario integer [primary key]
  Nombre varchar
  Fecha_contratacion timestamp
  especialidad_id integer
}

Table Visitante{
  ID_Visitante integer [primary key]
  Nombre varchar
  Fecha_registro timestamp

} 

Table Prestamo{
  ID_Prestamo integer [primary key]
  Visitante_id integer
  libro_id integer
  Fecha_Prestamo date
  Fecha_devolucion date
}

Table Ubicacion{
  ID_ubicacion integer [primary key]
  Nombre varchar
}


Table tipo{
  ID_tipo integer [primary key]
  Nombre varchar
}

Table Genero{
  ID_Genero integer [primary key]
  Nombre varchar
}

Table Especialidad{
  ID_Especialidad integer [primary key]
  Nombre varchar
}


REF: Libro.Seccion_id < Seccion.id_Seccion
REF: Seccion.Bibliotecario_id < Bibliotecario.ID_Bibliotecario
REF: Visitante.ID_Visitante < Prestamo.Visitante_id
REF: Prestamo.libro_id < Libro.Codigo
REF: Visitante.ID_Visitante <> Libro.Codigo
REF: Seccion.id_Seccion - Ubicacion.ID_ubicacion
REF: Seccion.tipo_id - tipo.ID_tipo
REF: Libro.Genero_id - Genero.ID_Genero
REF: Bibliotecario.especialidad_id < Especialidad.ID_Especialidad