# Proyecto GitHook - Verificador de Archivos

Este proyecto implementa un **pre-commit hook** en Git que verifica la existencia de un archivo llamado `pageweb.html` antes de permitir un commit. Si el archivo no existe, el hook muestra un error y detiene el proceso de commit.

---

## **Requisitos**
- Git instalado
- Visual Studio Code (u otro editor de texto)
- Permisos para ejecutar scripts en tu sistema operativo

---

## **1. Creación del Hook Pre-Commit**

### **Ubicación del archivo**
El archivo del hook debe colocarse en el directorio oculto `.git/hooks` de tu repositorio local.

### **Pasos para crear el hook**
1. Abre la terminal en Visual Studio Code (o tu editor preferido).
2. Crea el archivo `pre-commit` dentro de la carpeta `.git/hooks`:
   ```bash
   touch .git/hooks/pre-commit
   ```
3. Dale permisos de ejecución al hook:
   ```bash
   chmod +x .git/hooks/pre-commit
   ```
4. Abre el archivo `pre-commit` y pega el siguiente código:

   ```bash
   #!/bin/bash
   echo "⚙️ Verificando existencia del archivo pageweb.html..."

   # Verifica si el archivo existe
   if [ ! -f pageweb.html ]; then
       echo "❌ Error: El archivo 'pageweb.html' no existe. Por favor, agrégalo antes de hacer commit."
       exit 1  # Detiene el commit
   else
       echo "✅ Archivo 'pageweb.html' encontrado. Continuando con el commit."
   fi
   ```

5. Guarda el archivo.

---

## **2. Prueba del Hook**

### **Simular el error**
Para probar que el hook funciona correctamente:
1. Renombra temporalmente el archivo `pageweb.html`:
   ```bash
   mv pageweb.html pageweb_temp.html
   ```
2. Intenta hacer un commit:
   ```bash
   git add .
   git commit -m "Prueba del pre-commit hook"
   ```

   **Resultado esperado**:
   Si el archivo `pageweb.html` no existe, verás el siguiente error y el commit será detenido:
   ```
   ❌ Error: El archivo 'pageweb.html' no existe. Por favor, agrégalo antes de hacer commit.
   ```

3. Restaura el archivo renombrado:
   ```bash
   mv pageweb_temp.html pageweb.html
   ```

4. Intenta hacer un commit nuevamente. Si el archivo existe, el hook permitirá que el commit continúe sin errores.

---

## **3. Estructura del Proyecto**

El proyecto cuenta con los siguientes archivos:
- **pageweb.html**: Archivo HTML simple que se verifica con el hook.
- **.git/hooks/pre-commit**: Script del hook que valida la existencia del archivo `pageweb.html`.

### **Ejemplo del archivo `pageweb.html`**

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GitHook Example</title>
    <style>
        p {
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <h1>¡Bienvenido a GitHook</h1>
    <p>Este es un ejemplo de archivo HTML para probar el pre-commit.</p>
</body>
</html>
```

---

## **4. Funcionamiento del Hook**
1. Cuando intentas hacer un commit con `git commit`, el hook `pre-commit` se ejecuta automáticamente.
2. El script verifica si el archivo `pageweb.html` existe en la carpeta principal del repositorio.
3. Si el archivo no existe:
   - Muestra un mensaje de error.
   - Detiene el proceso de commit.
4. Si el archivo existe:
   - Permite que el commit continúe normalmente.

---

## **5. Beneficios de Implementar este Hook**
- **Automatización**: Garantiza que un archivo crítico siempre esté presente antes de confirmar cambios.
- **Control de errores**: Previene commits incompletos o configuraciones incorrectas.
- **Facilidad de uso**: Se ejecuta automáticamente sin necesidad de intervención manual.

---

## **6. Comandos Útiles**
- **Crear el hook**:
   ```bash
   touch .git/hooks/pre-commit
   ```
- **Dar permisos de ejecución**:
   ```bash
   chmod +x .git/hooks/pre-commit
   ```
- **Renombrar un archivo temporalmente**:
   ```bash
   mv pageweb.html pageweb_temp.html
   ```
- **Restaurar el archivo**:
   ```bash
   mv pageweb_temp.html pageweb.html
   ```
- **Realizar un commit**:
   ```bash
   git add .
   git commit -m "Mensaje de commit"
   ```

---

## **7. Notas Finales**
- Asegúrate de que la carpeta `.git/hooks` exista en tu repositorio.
- Este hook solo verifica la existencia del archivo `pageweb.html`. Puedes modificar el script para incluir más validaciones.
- Los hooks de Git son scripts poderosos que permiten automatizar tareas y mantener buenas prácticas en los repositorios.

---

**¡Listo! Ahora tu repositorio tiene un pre-commit hook funcional! 🚀**
