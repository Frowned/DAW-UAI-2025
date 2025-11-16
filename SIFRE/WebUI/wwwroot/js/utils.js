console.log('utils.js loaded');

function descargarArchivo(nombreArchivo, contenidoBase64) {
    const link = document.createElement('a');
    link.href = "data:application/pdf;base64," + contenidoBase64;
    link.download = nombreArchivo;
    document.body.appendChild(link);

    link.click();

    document.body.removeChild(link);
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