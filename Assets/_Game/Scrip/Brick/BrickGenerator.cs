using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class BrickGenerator : MonoBehaviour
{
    [System.Serializable]
    public class SpawnedBricks
    {
        public ColorType brickColorName;
        public Vector3 position;
        public bool removed;
    }
    public SpawnedBricks[] spawnedBricks;

    private Vector3 startPoint;
    private Vector3 position;

    private int length = 72;
    private int line = 12;
    private int brick = 15;

    private float zPosition;
    private float xPosition;

    public GameObject[] brickPrefabs;

    public void Start()
    {
        OnInit();

        InvokeRepeating(nameof(GenerateRemovedBrick), 5f, 1f);
    }

    void OnInit()
    {
        startPoint = transform.position;
        zPosition = transform.position.z;
        xPosition = transform.position.x;

        spawnedBricks = new SpawnedBricks[length];

        CreateBricks();
    }

    public void CreateBricks()
    {
        for (int i = 0; i < length; i++)
        {
            brick++;
            if (i % line == 0)
            {
                zPosition -= 1f;
                brick = 0;
                position = new Vector3(xPosition, startPoint.y, zPosition);
            }
            else
            {
                position = new Vector3(xPosition + brick, startPoint.y, zPosition);
            }

            Transform createBrick = Instantiate(brickPrefabs[Random.Range(0, brickPrefabs.Length)], position, Quaternion.identity).transform;

            createBrick.transform.SetParent(this.transform);
            createBrick.GetComponent<Brick>().numberBrick = i;
            PoolingColor(createBrick, createBrick.GetComponent<Brick>().pickupColor, i);
        }
    }

    public void MakeRemoved(int brickNumber)
    {
        spawnedBricks[brickNumber].removed = true;
    }
    private void PoolingColor(Transform createdBrick, ColorType colorName, int i)
    {
        var tmp = new SpawnedBricks();
        tmp.brickColorName = colorName;
        tmp.position = createdBrick.position;
        tmp.removed = false;
        spawnedBricks[i] = tmp;
    }

    public void GenerateRemovedBrick()
    {
        for (int i = 0; i < spawnedBricks.Length; i++)
        {
            if (spawnedBricks[i].removed == true)
            {
                int temp = (int)spawnedBricks[i].brickColorName;

                Transform createdBrick = Instantiate(brickPrefabs[temp], spawnedBricks[i].position, Quaternion.identity).transform;
                createdBrick.GetComponent<Brick>().numberBrick = i;
                spawnedBricks[i].removed = false;

                createdBrick.transform.SetParent(this.transform);
            }
        }
    }


    public void ShuffleBrick()
    {
        for (int i = 0; i < spawnedBricks.Length; i++)
        {
            int random = Random.Range(i, spawnedBricks.Length);
            spawnedBricks[i] = spawnedBricks[random];
        }
    }
}
