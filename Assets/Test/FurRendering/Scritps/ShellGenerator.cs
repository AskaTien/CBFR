using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//[ExecuteInEditMode]
[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
public class ShellGenerator : MonoBehaviour
{
    public uint layerCount;
    public float furLength;

    private Mesh mesh
    {
        get
        {
            if (m_MeshFilter == null)
            {
                m_MeshFilter = GetComponent<MeshFilter>();
            }

            return m_MeshFilter.sharedMesh;
        }
        set
        {
            m_MeshFilter.mesh = value;
        }
    }

    private MeshFilter m_MeshFilter;

    private void Start()
    {
        mesh = CreateShells(layerCount);
    }

    // Update is called once per frame
    void Update()
    {
        //mesh = CreateShells(layerCount);
    }

    private Mesh CreateShells(uint num)
    {
        Mesh furShell = new Mesh();
        CombineInstance[] shellsToCombine = new CombineInstance[num];

        for (int i = 0; i < num; i++)
        {
            shellsToCombine[i].mesh = AddShellLayer(i * furLength * 0.05f);
        }

        if (shellsToCombine.Length > 0)
        {
            furShell.name = "Fur Shell";
            furShell.CombineMeshes(shellsToCombine, false, false);
            //furShell = AddShellLayer(furLength * 0.05f);
            furShell.UploadMeshData(true);
        }

        return furShell;
    }
    private Mesh AddShellLayer(float step)
    {
        Mesh shell = Instantiate(mesh) as Mesh;
        Vector3[] vertices = mesh.vertices;
        Vector3[] normals = mesh.normals;
        //Vector2[] uv0 = new Vector2[mesh.vertexCount];

        for (int i = 0; i < mesh.vertexCount; i++)
        {
            vertices[i] += normals[i] * step;
            //normals[i] = mesh.normals[i];
            //uv0[i] = mesh.uv[i];
        }

        shell.SetVertices(vertices);
        //shell.SetNormals(normals);
        //shell.SetUVs(0, uv0);
        //shell.RecalculateTangents();
        //shell.RecalculateBounds();
        //shell.RecalculateNormals();

        return shell;
    }

    //private void OnDisable()
    //{
    //    mesh = null;
    //}
}
