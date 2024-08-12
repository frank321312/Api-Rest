export class ValidationError extends Error {
    constructor(message) {
        super(message)
        this.name = "ValidationError"
    }
}

export const validacionNombre = (nombre) => {
    let nombreLower = nombre.toLowerCase();
    if (!nombre) {
        throw new ValidationError("El nombre no puede ser nulo");
    } else if (!/^[^\s][a-zA-Z\s]{1,20}[^\s]$/.test(nombreLower) || 
                /(?<=\s)\s/g.test(nombreLower)) {
        throw new ValidationError("El nombre es invalido");
    }
}
