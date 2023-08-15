using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class CharacterController : MonoBehaviour
{
    public Transform posAddBricks;

    public Material characterMat;

    public ColorType characterColor;

    private BrickGenerator brickGenerator;

    [HideInInspector] public GameObject brickGeneratorObject;

    public LayerMask LayerStair;

    

    [SerializeField] DataColor dataColor;
    int QuantityBrick = 0;

    public static List<int> temp = new List<int>();
    public List<Brick> bricks = new List<Brick>();
    public List<Transform> listBrickCharater = new List<Transform>();

    private void Start()
    {
        foreach(ColorData a in dataColor.ColorDatas)
        {
            if (a.type == characterColor)
            {
                characterMat = a.mat;
                break;
            }
        }
    }

    private void Update()
    {
        CheckStair();
    }
    //public virtual void RandomCharacterColor(Transform CharacterRenderer, ColorType colorType)
    //{
    //    characterColor = colorType;
    //    renderer.material = dataColor.GetColorMat(colorType);
    //}


    protected virtual void AddBrick(Collider other)
    {
        QuantityBrick++;

        other.transform.SetParent(posAddBricks.transform);

        listBrickCharater.Add(other.transform);

        other.transform.localPosition = new Vector3(0, 0.25f * QuantityBrick, 0);
        other.transform.localRotation = Quaternion.identity;
    }

    protected virtual void RemoveBrick()
    {
        if (listBrickCharater.Count > 0)
        {
            QuantityBrick--;
            Transform lastChild = listBrickCharater[listBrickCharater.Count - 1];
            listBrickCharater.Remove(lastChild.transform);

            Destroy(lastChild.gameObject);

        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("BrickGreen") && characterColor == other.GetComponent<Brick>().pickupColor)
        {
            AddBrick(other);

            if (brickGenerator != null)
                brickGenerator.MakeRemoved(other.GetComponent<Brick>().numberBrick);
        }
    }


    protected virtual Stair CheckStair()
    {
        RaycastHit hit;

        if (Physics.Raycast(transform.position, Vector3.down, out hit,5f, LayerStair))
        {
            if (hit.collider != null)
            {
                var stair = hit.collider.GetComponent<Stair>();
                if (stair.colorType != characterColor && QuantityBrick != 0)
                {
                    RemoveBrick();
                    stair.ChangeColor(characterMat, characterColor);
                }
                if((stair.colorType != characterColor && QuantityBrick == 0))
                {

                }
            }

        }
        return null; 

    }
}


