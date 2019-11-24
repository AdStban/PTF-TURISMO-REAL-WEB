function validar() {

    expresion = /\w+@\w+\.+[a-z]/;

    // Obtención fecha actual.
    var f = new Date();
    var mes = (f.getMonth() + 1).toString();
    var dia = f.getDay().toString();

    if (mes.length <= 1) {
        mes = "0" + mes;
    }
    if (dia.length <= 1) {
        dia = "0" + dia;
    }

    fecha_actual = f.getFullYear() + "-" + mes + "-" + dia;
    // Obtención valores
    // formulario [register and login]
    var correo = document.getElementById("txtCorreo").value;
    var pass = document.getElementById("txtPassword").value;
    //  formulario [reserva]
    var fecha_desde = document.getElementById("cldFechaDesde").value;
    var fecha_hasta = document.getElementById("cldFechaHasta").value;
    var cant_dias = document.getElementById("txtCant_dias").value;
    var cant_personas = document.getElementById("txtCant_personas").value;
    //  formulario [registroDatosPersona]
    var nombre = document.getElementById("txtNombre").value;
    var apellido_pa = document.getElementById("txtApellido_pa").value;
    var apellido_ma = document.getElementById("txtApellido_ma").value;
    var contacto = document.getElementById("txtContacto").value;
    var direccion = document.getElementById("txtDireccion").value;
    var rut = document.frm.txtRut.value;
    var fecha_nacimiento = document.getElementById("cldFechaNacimiento").value;

    var error = document.getElementById("error");

    if (isNullOrEmpty(correo) && isNullOrEmpty(pass) && isNullOrEmpty(fecha_desde) && isNullOrEmpty(fecha_hasta)
            && isNullOrEmpty(cant_dias) && isNullOrEmpty(cant_personas) && isNullOrEmpty(nombre)
            && isNullOrEmpty(apellido_pa) && isNullOrEmpty(apellido_ma) && isNullOrEmpty(contacto)
            && isNullOrEmpty(direccion) && isNullOrEmpty(rut) && isNullOrEmpty(fecha_nacimiento)) {
        swal({
            title: "Error!",
            text: "Debe llenar todos los campos.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(correo)) {
        swal({
            title: "Error!",
            text: "El campo correo es necesario.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(pass)) {
        swal({
            title: "Error!",
            text: "El campo contraseña es necesario.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(fecha_desde)) {
        swal({
            title: "Error!",
            text: "La fecha desde es necesaria.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(fecha_hasta)) {
        swal({
            title: "Error!",
            text: "La fecha hasta es necesaria.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(cant_dias)) {
        swal({
            title: "Error!",
            text: "El campo cantidad de días es necesario.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(cant_personas)) {
        swal({
            title: "Error!",
            text: "El campo cantidad de personas es necesario.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(nombre)) {
        swal({
            title: "Error!",
            text: "El campo nombre no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(apellido_pa)) {
        swal({
            title: "Error!",
            text: "El campo apellido paterno no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(apellido_ma)) {
        swal({
            title: "Error!",
            text: "El campo apellido materno no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(contacto)) {
        swal({
            title: "Error!",
            text: "El campo contacto no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(direccion)) {
        swal({
            title: "Error!",
            text: "El campo dirección no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(rut)) {
        swal({
            title: "Error!",
            text: "El campo rut no debe estar vacío.",
            icon: "error",
        });
        return false;
    } else if (isNullOrEmpty(fecha_nacimiento)) {
        swal({
            title: "Error!",
            text: "La fecha de nacimiento es necesaria.",
            icon: "error",
        });
        return false;
    } else if (!expresion.test(correo)) {
        swal({
            title: "Error!",
            text: "El correo ingresado no es correcto.",
            icon: "error",
        });
        return false;
    } else if (correo.length > 100) {
        swal({
            title: "Error!",
            text: "El correo ingresado es muy largo.",
            icon: "error",
        });
        return false;
    } else if (correo.length <= 5) {
        swal({
            title: "Error!",
            text: "El correo ingresado es muy corto.",
            icon: "error",
        });
        return false;
    } else if (pass.length >= 50) {
        swal({
            title: "Error!",
            text: "La contraseña que ha ingresado es muy larga.",
            icon: "error",
        });
        return false;
    } else if (pass.length < 6) {
        swal({
            title: "Error!",
            text: "La contraseña que ha ingresado es muy corta. Debe ser de 6 carácteres.",
            icon: "error",
        });
        return false;
    } else if (fecha_desde < fecha_actual) {
        swal({
            title: "Error!",
            text: "La fecha que ha seleccionado es menor a la fecha actual.",
            icon: "error",
        });
        return false;
    } else if (fecha_hasta < fecha_actual) {
        swal({
            title: "Error!",
            text: "La fecha que ha seleccionado es menor a la fecha actual.",
            icon: "error",
        });
        return false;
    } else if (isNaN(cant_dias)) {
        swal({
            title: "Error!",
            text: "La cantidad de días ingresada debe ser un número.",
            icon: "error",
        });
        return false;
    } else if (cant_dias <= 0) {
        swal({
            title: "Error!",
            text: "La cantidad de días debe ser al menos de uno.",
            icon: "error",
        });
        return false;
    } else if (isNaN(cant_dias) > 100) {
        swal({
            title: "Error!",
            text: "La cantidad de días ingresada debe ser menor a 100.",
            icon: "error",
        });
        return false;
    } else if (cant_personas < 1) {
        swal({
            title: "Error!",
            text: "La cantidad de personas ingresada debe ser mayor a 1.",
            icon: "error",
        });
        return false;
    } else if (cant_personas > 10) {
        swal({
            title: "Error!",
            text: "La cantidad de personas debe ser menor a 10.",
            icon: "error",
        });
        return false;
    } else if (nombre.length > 30) {
        swal({
            title: "Error!",
            text: "El nombre ingresado debe ser mas corto.",
            icon: "error",
        });
        return false;
    } else if (nombre.length < 3) {
        swal({
            title: "Error!",
            text: "El nombre ingresado debe ser mas largo.",
            icon: "error",
        });
        return false;
    } else if (apellido_pa.length > 30) {
        swal({
            title: "Error!",
            text: "El apellido paterno ingresado debe ser mas corto.",
            icon: "error",
        });
        return false;
    } else if (apellido_pa.length < 3) {
        swal({
            title: "Error!",
            text: "El apellido paterno ingresado debe ser mas largo.",
            icon: "error",
        });
        return false;
    } else if (apellido_ma.length > 30) {
        swal({
            title: "Error!",
            text: "El apellido materno ingresado debe ser mas corto.",
            icon: "error",
        });
        return false;
    } else if (apellido_ma.length < 3) {
        swal({
            title: "Error!",
            text: "El apellido materno ingresado debe ser mas largo.",
            icon: "error",
        });
        return false;
    } else if (isNaN(contacto)) {
        swal({
            title: "Error!",
            text: "El contacto ingresado debe ser un número.",
            icon: "error",
        });
        return false;
    } else if (contacto.length < 3) {
        swal({
            title: "Error!",
            text: "El número de contacto es muy corto.",
            icon: "error",
        });
        return false;
    } else if (contacto.length > 15) {
        swal({
            title: "Error!",
            text: "El número de contacto es muy largo.",
            icon: "error",
        });
        return false;
    } else if (direccion.length < 5) {
        swal({
            title: "Error!",
            text: "La dirección ingresada es muy corta.",
            icon: "error",
        });
        return false;
    } else if (direccion.length > 60) {
        swal({
            title: "Error!",
            text: "La dirección ingresada es demasiado larga.",
            icon: "error",
        });
        return false;
    } else if (fecha_nacimiento > fecha_actual) {
        swal({
            title: "Error!",
            text: "La fecha de nacimiento seleccionada no puede ser mayor a la fecha actual.",
            icon: "error",
        });
        return false;
    } else if (calcularEdad() < 18) {
        swal({
            title: "Error!",
            text: "Usted debe ser mayor de edad.",
            icon: "error",
        });
        return false;
    }
}

function isNullOrEmpty(str) {
    var returnValue = false;
    if (!str
            || str == null
            || str === 'null'
            || str === ''
            || str === '{}'
            || str === 'undefined'
            || str.length === 0) {
        returnValue = true;
    }
    return returnValue;
}
function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replace('.', '');
    // Despejar Guión
    valor = valor.replace('-', '');

    // Aislar Cuerpo y Dígito Verificador
    cuerpo = valor.slice(0, -1);
    dv = valor.slice(-1).toUpperCase();

    // Formatear RUN
    rut.value = cuerpo + '-' + dv;

    // Si no cumple con el mínimo ej. (n.nnn.nnn)
    if (cuerpo.length < 7) {
        rut.setCustomValidity("El RUT que ha ingresado está incompleto.");
        return false;
    }

    // Calcular Dígito Verificador
    suma = 0;
    multiplo = 2;

    // Para cada dígito del Cuerpo
    for (i = 1; i <= cuerpo.length; i++) {

        // Obtener su Producto con el Múltiplo Correspondiente
        index = multiplo * valor.charAt(cuerpo.length - i);

        // Sumar al Contador General
        suma = suma + index;

        // Consolidar Múltiplo dentro del rango [2,7]
        if (multiplo < 7) {
            multiplo = multiplo + 1;
        } else {
            multiplo = 2;
        }

    }

    // Calcular Dígito Verificador en base al Módulo 11
    dvEsperado = 11 - (suma % 11);

    // Casos Especiales (0 y K)
    dv = (dv == 'K') ? 10 : dv;
    dv = (dv == 0) ? 11 : dv;

    // Validar que el Cuerpo coincide con su Dígito Verificador
    if (dvEsperado != dv) {
        rut.setCustomValidity("El RUT que ha ingresado no es válido.");
        return false;
    }

    // Si todo sale bien, eliminar errores (decretar que es válido)
    rut.setCustomValidity('');
}

// Amiguitos aquí Validamos que la persona sea mayor de edad.
function isValidDate(day, month, year)
{
    var dteDate;

    // En javascript, el mes empieza en la posicion 0 y termina en la 11 
    // 0 el mes de enero
    // Por eso, se le resta 1 al mes
    month = month - 1;
    dteDate = new Date(year, month, day);

    //Devuelva true o false...
    return ((day == dteDate.getDate()) && (month == dteDate.getMonth()) && (year == dteDate.getFullYear()));
}

function validate_fecha(fecha)
{
    var patron = new RegExp("^(19|20)+([0-9]{2})([-])([0-9]{1,2})([-])([0-9]{1,2})$");

    if (fecha.search(patron) == 0)
    {
        var values = fecha.split("-");
        if (isValidDate(values[2], values[1], values[0]))
        {
            return true;
        }
    }
    return false;
}

/**
 * Esta función calcula la edad de una persona y los meses
 * La fecha la tiene que tener el formato yyyy-mm-dd que es
 */
function calcularEdad()
{
    var fecha_nacimiento = document.getElementById("cldFechaNacimiento").value;
    if (validate_fecha(fecha_nacimiento) === true)
    {
        // Amiguitos aquí calculamos Si la fecha es correcta, en caso de que sea así calculamos la edad ;)
        var values = fecha_nacimiento.split("-");
        var dia = values[2];
        var mes = values[1];
        var ano = values[0];

        // Amiguitos aquí cogemos los valores actuales
        var fecha_hoy = new Date();
        var ahora_ano = fecha_hoy.getYear();
        var ahora_mes = fecha_hoy.getMonth() + 1;
        var ahora_dia = fecha_hoy.getDate();

        // Amiguitos aquí realizamos el calculo
        var edad = (ahora_ano + 1900) - ano;
        if (ahora_mes < mes)
        {
            edad--;
        }
        if ((mes == ahora_mes) && (ahora_dia < dia))
        {
            edad--;
        }
        if (edad > 1900)
        {
            edad -= 1900;
        }

        // Amiguitos aquí calculamos los meses
        var meses = 0;
        if (ahora_mes > mes)
            meses = ahora_mes - mes;
        if (ahora_mes < mes)
            meses = 12 - (mes - ahora_mes);
        if (ahora_mes == mes && dia > ahora_dia)
            meses = 11;

        // Amiguitos aquí calculamos los dias
        var dias = 0;
        if (ahora_dia > dia)
            dias = ahora_dia - dia;
        if (ahora_dia < dia)
        {
            ultimoDiaMes = new Date(ahora_ano, ahora_mes, 0);
            dias = ultimoDiaMes.getDate() - (dia - ahora_dia);
        }
        if(edad < 18){
            swal({
            title: "Error!",
            text: "Usted debe ser mayor de edad.",
            icon: "error",
        });
        return false;
        }
        //document.getElementById("result").innerHTML="Tienes "+edad+" años, "+meses+" meses y "+dias+" días";
    } else {
        document.getElementById("result").innerHTML = "La fecha " + fecha + " es incorrecta";
    }
}

