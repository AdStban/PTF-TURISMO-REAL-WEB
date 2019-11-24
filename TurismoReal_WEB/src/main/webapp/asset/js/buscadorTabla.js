/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function doSearch(){
    var tableReg = document.getElementById('datos');
    var searchText = document.getElementById('searchTerm').value.toLowerCase();
    var cellsOfRow = "";
    var found = false;
    var compareWith = "";
    
    //Recorrer todas las filas de la tabla
    for (var i = 1; i < tableReg.rows.length; i++)
    {
      cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
      found = false;
      
      //Recorrer todas las celdas
      for (var j = 0; j < cellsOfRow.length && !found; j++)
      {
          compareWith = cellsOfRow[j].innerHTML.toLowerCase();
          
          //Se busca el texto en el contenido de la celda
          if(searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
          {
              found = true;
          }
      }
      if(found)
      {
          tableReg.rows[i].style.display = '';
      }else{
          // Si no ha encontrado ninguna coincidencia, esconde la fila de la tabla
          tableReg.rows[i].style.display = 'none';
            
      }
    }
}

