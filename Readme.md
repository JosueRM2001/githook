## GitHook

This project implements a **pre-commit hook** in Git that checks for the existence of a file called `pageweb.html` before allowing a commit. If the file does not exist, the hook displays an error and stops the commit process.

---
## Technologies used

- DockerDesktop
- Visual Studio Code
- GitHub Actions
- Docker Hub

## Prerequisites
**To replicate or use this project, you need:**
-Install Visual Studio Code
```bash
https://code.visualstudio.com/
```
- Docker installed on your local machine at the following link:
```bash
https://www.docker.com/products/docker-desktop
```
- A Docker Hub account to store your images.
At the following link:
```bash
https://hub.docker.com/explore
```
- Git installed to manage the repository.
At the following link:
```bash
https://git-scm.com/
```

---

## **1. Creating the Pre-Commit Hook**

### **File Location**
The The hook file should be placed in the hidden `.git/hooks` directory of your local repository.

### **Steps to create the hook**
1. Open the terminal in Visual Studio Code (or your preferred editor).
2. Create the `pre-commit` file inside the `.git/hooks` folder:
```bash
touch .git/hooks/pre-commit
```
3. Open the `pre-commit` file and paste the following code :

```bash
#!/bin/bash
echo "⚙️ Checking for existence of pageweb.html file..."

# Check if the file exists
if [ ! -f pageweb.html ]; then
echo "❌ Error: File 'pageweb.html' does not exist. Please add it before committing."
exit 1 # Stop committing
else
echo "✅ File 'pageweb.html' found. Continuing with commit." fi
```

5. Save the file.

---

## **2. Test the Hook**

### **Fake the error**
To test that the hook works correctly:
1. Temporarily rename the file `pageweb .html`:
```bash
mv pageweb.html pageweb_temp.html
```
2. Try to commit:
```bash
git add .
git commit -m "Pre-commit hook test"
```

**Expected result**:
If the file `pageweb.html` does not exist, you will see the following error and the commit will be stopped:
```
❌ Error: The File 'pageweb.html' does not exist. Please add it before committing.
```

3. Restore the renamed file:
```bash
mv pageweb_temp.html pageweb.html
```

4. Try committing again. If the file exists, the hook will allow the commit to proceed without errors.

---

## **3. Project Structure**

The project has the following files:
- **pageweb.html**: Simple HTML file that It is verified with the hook.
- **.git/hooks/pre-commit**: Hook script that validates the existence of the `pageweb.html` file.

### **Example of the `pageweb.html` file**

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name=" viewport" content="width=device-width, initial-scale=1.0">
<title>GitHook Example</title>
<style>
p {
color: #7f8c8d;
}
</style>
</head>
<body>
< h1>Welcome to GitHook</h1>
<p>This is an example HTML file for testing pre-commit.</p>
</body>
</html>
```

---

## **4 . How the Hook Works**
1. When you try to commit with `git commit`, the `pre-commit` hook is executed automatically.
2. The script checks if the file `pageweb.html` exists in the repository's main folder.
3. If the file does not exist:
- Displays an error message.
- Stops the commit process.
4. If the file exists: - Allows the commit to continue normally.

---

## **5. Benefits of Implementing this Hook**
- **Automation**: Ensures that a critical file is always present before committing changes.
- **Error handling **: Prevents incomplete commits or incorrect configurations.
- **Ease of use**: Runs automatically without manual intervention.

---

## **6. Useful Commands**
- **Create the hook**:
```bash
touch .git/hooks/pre-commit
```
- **Give execution permissions**:
```bash
chmod +x .git/hooks /pre-commit
```
- **Temporarily rename a file**:
```bash
mv pageweb.html pageweb_temp.html
```
- **Restore the file**:
```bash
mv pageweb_temp.html pageweb. html
```
- **Make a commit**:
```bash
git add .
git commit -m "Commit message"
```
