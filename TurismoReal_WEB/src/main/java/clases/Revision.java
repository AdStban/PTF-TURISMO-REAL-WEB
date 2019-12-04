package clases;

public class Revision {

    int revision;
    char estado_revision;
    String detalle_salida;
    int id_detalle;

    public Revision() {
    }

    public Revision(int revision, char estado_revision, String detalle_salida, int id_detalle) {
        this.revision = revision;
        this.estado_revision = estado_revision;
        this.detalle_salida = detalle_salida;
        this.id_detalle = id_detalle;
    }

    public int getRevision() {
        return revision;
    }

    public void setRevision(int revision) {
        this.revision = revision;
    }

    public char getEstado_revision() {
        return estado_revision;
    }

    public void setEstado_revision(char estado_revision) {
        this.estado_revision = estado_revision;
    }

    public String getDetalle_salida() {
        return detalle_salida;
    }

    public void setDetalle_salida(String detalle_salida) {
        this.detalle_salida = detalle_salida;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }
}
