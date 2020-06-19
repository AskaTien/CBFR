using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

//[ExecuteInEditMode]
[RequireComponent(typeof(MeshFilter))]
[RequireComponent(typeof(MeshRenderer))]
public class ShellGenerator : MonoBehaviour
{
    public int m_LayerCount;
    public float furLength;
    public Vector3 gravity = new Vector3(0, -1, 0);
    [Range(0,1)]
    public float gravityStrength = 0.5f;

    //public int layerCount
    //{
    //    get
    //    {
    //        return m_LayerCount;
    //    }
    //    set
    //    {
    //        m_LayerCount = value;
    //        CreateShells(m_LayerCount);
    //    }
    //}

    private Mesh baseMesh;

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

    private void OnEnable()
    {
        baseMesh = mesh;
    }

    private void Start()
    {
        mesh = CreateShells(m_LayerCount);
    }

    private void Update()
    {
        //mesh = CreateShells(m_LayerCount);
    }

    //private void OnDisable()
    //{
    //    mesh = mesh;
    //}

    private Mesh CreateShells(int num)
    {
        Mesh furShell = new Mesh();
        CombineInstance[] shellsToCombine = new CombineInstance[num];

        for (int i = 0; i < num; i++)
        {
            shellsToCombine[i].mesh = AddShellLayer(i / (float)num * furLength * 0.01f);
        }

        if (shellsToCombine.Length > 0)
        {
            furShell.name = "Fur Shell";
            furShell.indexFormat = IndexFormat.UInt32;
            furShell.CombineMeshes(shellsToCombine, true, false);
            furShell.UploadMeshData(true);
        }

        return furShell;
    }
    
    private Mesh AddShellLayer(float step)
    {
        Mesh shell = Instantiate(baseMesh) as Mesh;
        shell.MarkDynamic();
        Vector3[] vertices = shell.vertices;
        Vector2[] uv2 = new Vector2[shell.vertexCount];
        for (int i = 0; i < shell.vertexCount; i++)
        {
            Vector3 direction = Vector3.Lerp(shell.normals[i], gravity * gravityStrength + shell.normals[i] * (1 - gravityStrength), step);
            vertices[i] += direction * step;
            uv2[i] = new Vector2(i / (float)shell.vertexCount, step / furLength * 100);
        }

        shell.vertices = vertices;
        shell.uv2 = uv2;

        return shell;
    }
}
