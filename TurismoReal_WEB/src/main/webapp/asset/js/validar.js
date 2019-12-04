function validarRegistroCuenta() {
    expresion = /\w+@\w+\.+[a-z]/;
    // formulario [register and login]
    var correo = document.getElementById("correo").value;
    var pass = document.getElementById("pass").value;

    if (isNullOrEmpty(correo) && isNullOrEmpty(pass)) {
        swal({
            title: "Advertencia",
            text: "Debe ingresar datos",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(correo)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar un correo",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(pass)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar una contraseña",
            icon: "warning",
        });
        return false;
    } else if (!expresion.test(correo)) {
        swal({
            title: "Advertencia",
            text: "El correo ingresado no es correcto",
            icon: "warning",
        });
        return false;
    } else if (correo.length > 50) {
        swal({
            title: "Advertencia",
            text: "El correo ingresado es muy largo.",
            icon: "warning",
        });
        return false;
    } else if (correo.length <= 5) {
        swal({
            title: "Advertencia",
            text: "El correo ingresado es muy corto.",
            icon: "warning",
        });
        return false;
    } else if (pass.length >= 15) {
        swal({
            title: "Advertencia",
            text: "La contraseña deber contener entre 6 y 15 carácteres",
            icon: "warning",
        });
        return false;
    } else if (pass.length < 6) {
        swal({
            title: "Advertencia",
            text: "La contraseña deber contener entre 6 y 15 carácteres",
            icon: "warning",
        });
        return false;
    }
}

function validarBuscador(){
    // Obtención fecha actual.
    var fecha_actual = new Date();
    var dd = fecha_actual.getDate();
    var mm = fecha_actual.getMonth() + 1;
    var yyyy = fecha_actual.getFullYear();

    dd = addZero(dd);
    mm = addZero(mm);

    fecha_actual = yyyy + '-' + mm + '-' + dd;
    // Obtención valores
    var lugar = document.getElementById("lugar").value;
    var desde = document.getElementById("desde").value;
    var hasta = document.getElementById("hasta").value;
    
    if (isNullOrEmpty(lugar) && isNullOrEmpty(desde)
             && isNullOrEmpty(hasta)) {
        swal({
            title: "Advertencia",
            text: "Debe ingresar el lugar y las fechas deseadas",
            icon: "warning",
        });
        return false;
    } else if (lugar==="0") {
        swal({
            title: "Advertencia",
            text: "Debes ingresar el lugar al que quieres ir",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(desde)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar la fecha inicial",
            icon: "warning",
        });
        return false;
    }else if (isNullOrEmpty(lugar)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar la fecha final",
            icon: "warning",
        });
        return false;
    } else if (desde <= fecha_actual) {
        swal({
            title: "Advertencia",
            text: "La fecha inicial no debe ser igual o menor al día de hoy",
            icon: "warning",
        });
        return false;
    } else if ( hasta <= fecha_actual) {
        swal({
            title: "Advertencia",
            text: "La fecha final no debe ser igual o menor al día de hoy",
            icon: "warning",
        });
        return false;
    } else if (desde >= hasta) {
        swal({
            title: "Advertencia",
            text: "La fecha final debe ser mayor a la fecha inicial",
            icon: "warning",
        });
        return false;
    } 
}
//funcion que ayuda a obtener la fecha actual
function addZero(i) {
    if (i < 10) {
        i = '0' + i;
    }
    return i;
}

function validarFormularioReserva() {

    expresion = /\w+@\w+\.+[a-z]/;

    // Obtención fecha actual.
    var fecha_actual = new Date();
    var dd = fecha_actual.getDate();
    var mm = fecha_actual.getMonth() + 1;
    var yyyy = fecha_actual.getFullYear();

    dd = addZero(dd);
    mm = addZero(mm);

    fecha_actual = yyyy + '-' + mm + '-' + dd;
    // Obtención valores

    //  formulario [reserva]
    var fecha_desde = document.getElementById("txtDesde").value;
    var fecha_hasta = document.getElementById("txtHasta").value;
    
    var cant_personas = document.getElementById("txtPersonas").value;

    //







    var error = document.getElementById("error");

    if (isNullOrEmpty(fecha_desde) && isNullOrEmpty(fecha_hasta)
             && isNullOrEmpty(cant_personas)) {
        swal({
            title: "Advertencia",
            text: "Debe ingresar los datos solicitados",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(fecha_desde)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar la fecha desde",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(fecha_hasta)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar la fecha hasta",
            icon: "warning",
        });
        return false;
    } else if (fecha_desde <= fecha_actual) {
        swal({
            title: "Advertencia",
            text: "La fecha desde es menor al día de hoy",
            icon: "warning",
        });
        return false;
    } else if (fecha_hasta <= fecha_actual) {
        swal({
            title: "Advertencia",
            text: "La fecha de hasta es menor al día de hoy",
            icon: "warning",
        });
        return false;
    } else if (fecha_desde >= fecha_hasta) {
        swal({
            title: "Advertencia",
            text: "La fecha final debe ser mayor a la fecha inicial",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(cant_personas)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar la cantidad de personas",
            icon: "warning",
        });
        return false;
    } else if (cant_personas < 1) {
        swal({
            title: "Advertencia",
            text: "La cantidad de personas debe ser mayor a 1",
            icon: "warning",
        });
        return false;
    } else if (cant_personas > 5) {
        swal({
            title: "Advertencia",
            text: "La cantidad de personas debe ser menor o igual a 5",
            icon: "warning",
        });
        return false;
    }
}

function validarRegistroDatos() {
    expresion = /\w+@\w+\.+[a-z]/;

    // Obtención fecha actual.
    // Obtención fecha actual.
    fecha_actual = new Date();
    var dd = fecha_actual.getDate();
    var mm = fecha_actual.getMonth() + 1;
    var yyyy = fecha_actual.getFullYear();

    dd = addZero(dd);
    mm = addZero(mm);

    fecha_actual = yyyy + '-' + mm + '-' + dd;

    //  formulario [registroDatosPersona]
    var nombre = document.getElementById("txtNombre").value;
    var apellido_pa = document.getElementById("txtApellidoPa").value;
    var apellido_ma = document.getElementById("txtApellidoMa").value;
    var rut = document.frm.txtRut.value;
    var contacto = document.getElementById("txtTelefono").value;
    var fecha_nacimiento = document.getElementById("dateFechaNac").value;
    var direccion = document.getElementById("txtDireccion").value;



    if (isNullOrEmpty(nombre) && isNullOrEmpty(apellido_pa) && isNullOrEmpty(apellido_ma) && isNullOrEmpty(contacto)
            && isNullOrEmpty(direccion) && isNullOrEmpty(rut) && isNullOrEmpty(fecha_nacimiento)) {
        swal({
            title: "Advertencia",
            text: "Debes completar todos los datos",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(nombre)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú nombre",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(apellido_pa)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú apellido paterno",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(apellido_ma)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú apellido materno",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(rut)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú rut",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(contacto)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú numero de telefono",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(fecha_nacimiento)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú fecha de nacimiento",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(direccion)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú domicilio",
            icon: "warning",
        });
        return false;
    } else if (nombre.length > 20) {
        swal({
            title: "Advertencia",
            text: "El nombre ingresado debe ser menos de 20 carácteres",
            icon: "warning",
        });
        return false;
    } else if (nombre.length < 3) {
        swal({
            title: "Advertencia",
            text: "El nombre ingresado debe contener mas de 3 carácteres",
            icon: "warning",
        });
        return false;
    } else if (!isNaN(nombre)) {
        swal({
            title: "Advertencia",
            text: "NO debes ingresar números en el nombre",
            icon: "warning",
        });
        return false;
    } else if (apellido_pa.length > 15) {
        swal({
            title: "Advertencia",
            text: "El apellido paterno debe ser menor a 10 carácteres",
            icon: "warning",
        });
        return false;
    } else if (apellido_pa.length < 3) {
        swal({
            title: "Advertencia",
            text: "El apellido paterno ingresado debe contener mas de 3 carácteres",
            icon: "warning",
        });
        return false;
    } else if (!isNaN(apellido_pa)) {
        swal({
            title: "Advertencia",
            text: "NO debes ingresar números en el apellido paterno",
            icon: "warning",
        });
        return false;
    } else if (apellido_ma.length > 15) {
        swal({
            title: "Advertencia",
            text: "El apellido materno debe ser menor a 10 carácteres",
            icon: "warning",
        });
        return false;
    } else if (apellido_ma.length < 3) {
        swal({
            title: "Advertencia",
            text: "El apellido materno debe contener mas de 3 carácteres",
            icon: "warning",
        });
        return false;

    } else if (!isNaN(apellido_ma)) {
        swal({
            title: "Advertencia",
            text: "NO debes ingresar números en el apellido materno",
            icon: "warning",
        });
        return false;
    } else if (checkRut(rut)) {
        swal({
            title: "Advertencia",
            text: "El rut es inválido",
            icon: "warning",
        });
        return false;
    } else if (isNaN(contacto)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar números en el contacto",
            icon: "warning",
        });
        return false;
    } else if (contacto.length < 3) {
        swal({
            title: "Advertencia",
            text: "El número de contacto es muy corto",
            icon: "warning",
        });
        return false;
    } else if (contacto.length > 15) {
        swal({
            title: "Advertencia",
            text: "El número de contacto es muy largo.",
            icon: "warning",
        });
        return false;
    } else if (direccion.length < 8) {
        swal({
            title: "Advertencia",
            text: "La dirección ingresada debe contener mas de 8 carácteres",
            icon: "warning",
        });
        return false;
    } else if (direccion.length > 25) {
        swal({
            title: "Advertencia",
            text: "La dirección ingresada debe contener menos de 25 carácteres",
            icon: "warning",
        });
        return false;
    } else if (fecha_nacimiento > fecha_actual) {
        swal({
            title: "Advertencia",
            text: "La fecha de nacimiento seleccionada no puede ser mayor a la fecha actual",
            icon: "warning",
        });
        return false;
    } else if (calcularEdad() < 18) {
        swal({
            title: "Advertencia",
            text: "Debes ser mayor de edad",
            icon: "warning",
        });
        return false;
    }

}

function validarModificarDatos() {




    //  formulario [Actualiza datos persona]
    var nombre = document.getElementById("txtNombre").value;
    var contacto = document.getElementById("txtTelefono").value;
    var direccion = document.getElementById("txtDireccion").value;



    if (isNullOrEmpty(nombre) && isNullOrEmpty(contacto)
            && isNullOrEmpty(direccion)) {
        swal({
            title: "Advertencia",
            text: "Debes completar todos los datos",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(nombre)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú nombre",
            icon: "warning",
        });
        return false;
    }  else if (isNullOrEmpty(contacto)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú numero de telefono",
            icon: "warning",
        });
        return false;
    } else if (isNullOrEmpty(direccion)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar tú domicilio",
            icon: "warning",
        });
        return false;
    } else if (nombre.length > 20) {
        swal({
            title: "Advertencia",
            text: "El nombre ingresado debe ser menos de 20 carácteres",
            icon: "warning",
        });
        return false;
    } else if (nombre.length < 3) {
        swal({
            title: "Advertencia",
            text: "El nombre ingresado debe contener mas de 3 carácteres",
            icon: "warning",
        });
        return false;
    } else if (!isNaN(nombre)) {
        swal({
            title: "Advertencia",
            text: "NO debes ingresar números en el nombre",
            icon: "warning",
        });
        return false;
    } else if (isNaN(contacto)) {
        swal({
            title: "Advertencia",
            text: "Debes ingresar números en el contacto",
            icon: "warning",
        });
        return false;
    } else if (contacto.length < 3) {
        swal({
            title: "Advertencia",
            text: "El número de contacto es muy corto",
            icon: "warning",
        });
        return false;
    } else if (contacto.length > 15) {
        swal({
            title: "Advertencia",
            text: "El número de contacto es muy largo.",
            icon: "warning",
        });
        return false;
    } else if (direccion.length < 8) {
        swal({
            title: "Advertencia",
            text: "La dirección ingresada debe contener mas de 8 carácteres",
            icon: "warning",
        });
        return false;
    } else if (direccion.length > 25) {
        swal({
            title: "Advertencia",
            text: "La dirección ingresada debe contener menos de 25 carácteres",
            icon: "warning",
        });
        return false;
    }
    
   
}

function calcularDias() {
    var fechaini = new Date(document.getElementById("txtDesde").value);
    var fechafin = new Date(document.getElementById("txtHasta").value);
    var diasdif = fechafin.getTime() - fechaini.getTime();
    var contdias = Math.round(diasdif / (1000 * 60 * 60 * 24));
    document.getElementById("txtDias").innerHTML = contdias;
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
    var fecha_nacimiento = document.getElementById("dateFechaNac").value;
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
        if (edad < 18) {
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

function validarCheckbox() {
    if ($('input[type=checkbox]:checked').length === 0) {
        swal({
            title: "Advertencia",
            text: "Debes seleccionar un estado",
            icon: "warning",
        });
        return false;
    } else {
        if ($('input[type=checkbox]:checked').length === 2) {
            swal({
            title: "Advertencia",
            text: "Debes seleccionar solo un estado",
            icon: "warning",
        });
        return false;   
        }
    }

}

