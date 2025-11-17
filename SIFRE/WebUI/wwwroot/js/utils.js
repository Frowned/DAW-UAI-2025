console.log('utils.js loaded');

function descargarArchivo(nombreArchivo, contenidoBase64) {
    try {
        // Convertir Base64 a Blob para mejor manejo de memoria
        const byteCharacters = atob(contenidoBase64);
        const byteNumbers = new Array(byteCharacters.length);
        for (let i = 0; i < byteCharacters.length; i++) {
            byteNumbers[i] = byteCharacters.charCodeAt(i);
        }
        const byteArray = new Uint8Array(byteNumbers);
        const blob = new Blob([byteArray], { type: 'application/pdf' });

        // Crear URL del blob
        const blobUrl = URL.createObjectURL(blob);

        const link = document.createElement('a');
        link.href = blobUrl;
        link.download = nombreArchivo;
        link.style.display = 'none';
        document.body.appendChild(link);

        link.click();

        // Limpiar después de un delay para dar tiempo al navegador
        setTimeout(() => {
            document.body.removeChild(link);
            URL.revokeObjectURL(blobUrl); // Liberar memoria
        }, 100);
    } catch (error) {
        console.error('Error al descargar archivo:', error);
        alert('Error al descargar el archivo. Por favor, intente nuevamente.');
    }
}

window.descargarArchivo = descargarArchivo; 

function downloadFile(contentType, fileName, base64Content) {
    try {
        const link = document.createElement('a');
        link.href = `data:${contentType};base64,${base64Content}`;
        link.download = fileName;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    } catch (e) {
        console.error('downloadFile error', e);
    }
}

window.downloadFile = downloadFile;

// Función para descargar PDF desde API endpoint
async function downloadPdfFromApi(endpoint, data) {
    try {
        const response = await fetch(endpoint, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(errorText || 'Error al generar el PDF');
        }

        // Obtener el blob del PDF
        const blob = await response.blob();

        // Obtener el nombre del archivo desde el header Content-Disposition
        const contentDisposition = response.headers.get('Content-Disposition');
        let fileName = 'documento.pdf';
        if (contentDisposition) {
            const fileNameMatch = contentDisposition.match(/filename="?([^"]+)"?/);
            if (fileNameMatch) {
                fileName = fileNameMatch[1];
            }
        }

        // Crear URL del blob y descargar
        const blobUrl = URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = blobUrl;
        link.download = fileName;
        link.style.display = 'none';
        document.body.appendChild(link);
        link.click();

        // Limpiar
        setTimeout(() => {
            document.body.removeChild(link);
            URL.revokeObjectURL(blobUrl);
        }, 100);

        return { success: true };
    } catch (error) {
        console.error('Error al descargar PDF:', error);
        return { success: false, error: error.message };
    }
}

window.downloadPdfFromApi = downloadPdfFromApi;